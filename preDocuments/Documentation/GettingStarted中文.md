## 基本

观察者模式（Observable <Element> sequence）和正常序列（Sequence）的等价性是了解Rx最重要的事情

每个Observable序列只是一个序列。 Observable vs Swift序列的主要优点是它也可以异步接收元素。这是RxSwift的核心，这里的文档是关于我们扩展这个想法的方法。

Observable（ObservableType）等同于Sequence
ObservableType.subscribe方法等同于Sequence.makeIterator方法。
需要将Observer（回调）传递给ObservableType.subscribe方法以接收序列元素，而不是在返回的迭代器上调用next（）。
序列是一个简单，熟悉的概念，易于可视化 

人是具有巨大视觉皮层的生物。当我们可以轻松地想象一个概念时，可以更容易地推理它。

我们可以通过尝试模拟每个Rx运算符内的事件状态机到序列上的高级操作来解除许多认知负担。

如果我们不使用Rx但是模型异步系统，这可能意味着我们的代码充满了状态机和瞬态，我们需要模拟而不是抽象。

列表和序列可能是数学家和程序员学习的第一个概念之一。

这是一系列数字：

```
--1--2--3--4--5--6--| // terminates normally
```

 另一个序列，带有字符：

```
--a--b--a--a--a---d---X // terminates with error
```

一些序列是有限的，而其他序列是无限的，就像一系列按钮点击：

```
---tap-tap-------tap--->
```

rxmarbles.com上有更多的大理石图。

如果我们将序列语法指定为正则表达式，它将如下所示：

```
next* (error | completed)?
```

这描述了以下内容：

序列可以具有0个或更多个元素。
一旦收到错误或已完成的事件，序列就不能产生任何其他元素。Rx中的序列由推送接口（又称回调）描述。

```swift
enum Event<Element>  {
    case next(Element)      // next element of a sequence
    case error(Swift.Error) // sequence failed with error
    case completed          // sequence terminated successfully
}

class Observable<Element> {
    func subscribe(_ observer: Observer<Element>) -> Disposable
}

protocol ObserverType {
    func on(_ event: Event<Element>)
}
```

当序列发送完成或错误事件时，将释放计算序列元素的所有内部资源。

要立即取消序列元素和免费资源的生成，请在返回的订阅上调用dispose

如果序列在有限时间内终止，则不调用dispose或不使用dispos（by：disposeBag）将不会导致任何永久性资源泄漏。但是，这些资源将在序列完成之前使用，方法是完成元素的生成或返回错误。

如果序列没有自行终止，例如使用一系列按钮点击，则将永久分配资源，除非使用takeUntil运算符手动调用disposeBag内部的dispose，或者以其他方式调用dispose。

使用dispose bags或takeUntil操作是确保清理资源的有效方法。我们建议在生产中使用它们，即使序列将在有限时间内终止。

## disposing 

观察到的序列可以另外一种方法终止。当我们完成序列并且我们想要释放分配用于计算即将到来的元素的所有资源时，我们可以在订阅上调用dispose

```swift

let scheduler = SerialDispatchQueueScheduler(qos: .default)
let subscription = Observable<Int>.interval(.milliseconds(300), scheduler: scheduler)
    .subscribe { event in
        print(event)
    }

Thread.sleep(forTimeInterval: 2.0)

subscription.dispose()
```

你只需要并行发生两个操作。

1. 生产者
2. subscription

```swift
let subscription = Observable<Int>.interval(.milliseconds(300), scheduler: scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                print(event)
            }

// ....

subscription.dispose() // called from main thread
```

```swift
let subscription = Observable<Int>.interval(.milliseconds(300), scheduler: scheduler)
            .observeOn(serialScheduler)
            .subscribe { event in
                print(event)
            }

// ...

subscription.dispose() // executing on same `serialScheduler`
```

dispose调用返回后，将不会打印任何内容。这是有保证的

## dispose Bags

类似ARC的行为返回到RX

当DisposeBag被取消分配时，it will call dispose on each of the added disposables.。

它没有dispose方法，因此不允许故意调用显式处理。如果需要立即清理，我们可以创建一个新包。

self.disposeBag = DisposeBag（）

如果仍需要明确的手动处理，请使用CompositeDisposable。它具有所需的行为，但一旦调用了dispose方法，它将立即处置任何 added disposable.

## Take until

在dealloc上自动处理订阅的其他方法是使用takeUntil运算符

```
sequence
    .takeUntil(self.rx.deallocated)
    .subscribe {
        print($0)
    }
```

