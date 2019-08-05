## 为啥

**disposed** 面对轻盈的绑定官方推荐

### Delegates

```swift
self.resultsTableView
    .rx.contentOffset
    .map { $0.x }
    .bind(to: self.leftPositionConstraint.rx.constant)
```

### KVO

```swift
someSuspiciousViewController
    .rx.observeWeakly(Bool.self, "behavingOk")
    .subscribe(onNext: { behavingOk in
        print("Cats can purr? \(behavingOk)")
    })
    .disposed(by: disposeBag)
```

### Notifiation

```swift
NotificationCenter.default
    .rx.notification(NSNotification.Name.UITextViewTextDidBeginEditing, object: myTextView)
    .map {  /*do something with data*/ }
    ....
```

## 多变的状态

编写异步程序时，transient易变 state 也存在很多问题
典型示例是自动完成搜索框。

各种情况用Rx 的代码

```swift
searchTextField.rx.text
    .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
    .distinctUntilChanged()
    .flatMapLatest { query in
        API.getSearchResults(query)
            .retry(3)
            .startWith([]) // clears results on new search term
            .catchErrorJustReturn([])
    }
    .subscribe(onNext: { results in
      // bind to ui
    })
    .disposed(by: disposeBag)
    
```

## 成分处理

假设希望在表格试图中显示模糊的图像。1 从URL 中提取图像，然后解码模糊的图像 2然后模糊

如果单元格退出可见的表格视图区域可以取消整个过程也是很好的，因为模糊的带宽和处理器时间很昂贵。

如果我们不是在单元格进入可见区域后立即开始获取图像也是很好的，因为如果用户滑动非常快，可能会有很多请求被触发和取消。

如果我们可以限制并发图像操作的数量也会很好，因为再次模糊图像是一项昂贵的操作。

大概的解决方案

```swift
let imageSubscription = imageURLs
    .throttle(.milliseconds(200), scheduler: MainScheduler.instance)
    .flatMapLatest { imageURL in
        API.fetchImage(imageURL)
    }
    .observeOn(operationScheduler)
    .map { imageData in
        return decodeAndBlurImage(imageData)
    }
    .observeOn(MainScheduler.instance)
    .subscribe(onNext: { blurredImage in
        imageView.image = blurredImage
    })
    .disposed(by: reuseDisposeBag)
    
```

此代码将执行所有这些操作，并且在处理imageSubscription时，它将取消所有相关的异步操作，并确保没有绑定到UI的恶意图像。

## 聚合网络请求

如果您需要触发两个请求并在两个请求完成时汇总结果，该怎么办？

of course the zip operator

```swift
let userRequest: Observable<User> = API.getUser("me")
let friendsRequest: Observable<[Friend]> = API.getFriends("me")

Observable.zip(userRequest, friendsRequest) { user, friends in
    return (user, friends)
}
.subscribe(onNext: { user, friends in
    // bind them to the user interface
})
.disposed(by: disposeBag)
```

那么，如果这些API在后台线程上返回结果，并且绑定必须在主UI线程上发生呢？`observeOn`.

```swift
let userRequest: Observable<User> = API.getUser("me")
let friendsRequest: Observable<[Friend]> = API.getFriends("me")

Observable.zip(userRequest, friendsRequest) { user, friends in
    return (user, friends)
}
.observeOn(MainScheduler.instance)
.subscribe(onNext: { user, friends in
    // bind them to the user interface
})
.disposed(by: disposeBag)
```

...还有很多

## 状态

对battle combinatorial explosion 的常用方法保持状态尽可能简单，并使用单向数据流来模拟派生数据。

这是Rx真正闪耀的地方。

Rx是功能性和命令性世界之间的最佳点。 它使您能够使用不可变定义和纯函数以可靠的可组合方式处理可变状态的快照。

Rx is that sweet spot between functional and imperative worlds. It enables you to use immutable definitions and pure functions to process snapshots of mutable state in a reliable composable way.

### 例子

### Easy integration 易于集成

如何创建自己的observable ，相当简单。代码出自RxCocoa 需要包裹URLSession 的http请求

```swift
extension Reactive where Base: URLSession {
    public func response(request: URLRequest) -> Observable<(Data, HTTPURLResponse)> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: request) { (data, response, error) in
            
                guard let response = response, let data = data else {
                    observer.on(.error(error ?? RxCocoaURLError.unknown))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.on(.error(RxCocoaURLError.nonHTTPResponse(response: response)))
                    return
                }

                observer.on(.next(data, httpResponse))
                observer.on(.completed)
            }

            task.resume()

            return Disposables.create(with: task.cancel)
        }
    }
}
```

## 优点

简而言之

可组合< - 因为Rx是组合的昵称
可重用< - 因为它是可组合的
声明性< - 因为定义是不可变的，只有数据发生变化
可理解和简洁< - 提高抽象级别并消除瞬态
稳定< - 因为Rx代码经过了彻底的单元测试
较少有状态< - 因为您将应用程序建模为单向数据流
没有泄漏< - 因为资源管理很容易

Composable <- Because Rx is composition's nickname
Reusable <- Because it's composable
Declarative <- Because definitions are immutable and only data changes
Understandable and concise <- Raising the level of abstraction and removing transient states
Stable <- Because Rx code is thoroughly unit tested
Less stateful <- Because you are modeling applications as unidirectional data flows
Without leaks <- Because resource management is easy

## 人无完人

使用Rx对尽可能多的应用程序进行建模通常是个好主意。

但是，如果您不了解所有operators以及是否存在某些operator对您的特定情况进行建模，该怎么办？

好吧，所有Rx操作符都基于数学，应该是直观的。

好消息是大约10-15个operators覆盖了大多数典型的用例。 该列表已包含一些熟悉的，如map，filter，zip，observeOn，...

所有Rx operator 都有很多名单。

对于每个operator，都有一个Marble Diagram，有助于解释它是如何工作的。

但是，如果您需要一些不在该列表中的operator，该怎么办？ 那么，你可以建立自己的operator。

如果由于某种原因创建那种operator真的很难，或者你需要使用一些遗留的有状态代码，该怎么办？ 好吧，你已经弄得一团糟，但你可以轻松跳出Rx 清单，处理数据，然后按照非rx 模式处理它。