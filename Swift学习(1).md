# 前提

2 标题 3 详细

链接 学习资料 尽量2019 年 swfit 4 以上 
demo 要整理 & 发布
GitHub: 
https://github.com/Bintong/SwiftObjLearn

## TabBar NavBar

### 问题

#### 1 冒号和等于号

： 类型注明

= 赋值

## 基础控件

### UILabel && UIButton

### 问题

#### 1 枚举变量 问题

 点 .normal .highlight 

#### 2 井号问题

井号 + selector

#### 3 @objc func 

提供OC 调用的方法 为啥在点击事件上，不知道了	



## 列表 

### 链接

https://blog.csdn.net/weixin_43704791/article/details/86239988



### 问题

####1 var  let 

 https://blog.csdn.net/fish_yan_/article/details/79785017 

let  不可变的常量

var 可变的变量

####2  Swift中的问号?和感叹号!



```
var arrayCount = dataList?.count
```

这时问号的意思类似于isResponseToSelector，即如果变量是nil，则不能响应后面的方法，所以会直接返回nil。如果变量非nil，就会拆Some(T)的包，取出原始值执行后面的操作。

```
var arrayCount = List!.count
```

这里的叹号和之前的问号则不同，这里表示我确定dataList一定是非nil的，所以直接拆包取出原始值进行处理。因此此处如果不小心让dataList为nil，程序就会crash掉。

**回到上面声明时？和！区别的问题上去**
声明变量时的？只是单纯的告诉Swift这是Optional的，如果没有初始化就默认为nil，而通过！声明，则之后对该变量操作的时候都会隐式的在操作前添加一个！。

1. 1. 问号？
      a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
      b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。

   2. 叹号！
      a.声明时添加！，告诉这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
      b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理

      

## 自定义view

### 问题

#### 权限 key

1 private 2 override 3 static 4 extension

可对外调用的函数 无标示

#### set get

var 属性 中 didSet 、 willSet \ get . set 

#### 回掉

https://www.jianshu.com/p/c1059b2f3351

1 闭包

 func callBackBlock(block:@escaping swiftBlock) 

 逃逸闭包，非逃逸闭包noescaping

https://blog.csdn.net/qq_30932479/article/details/80517518	

2 代理

和oc 不一样的是逗号分隔

## 宏定义

```swift
let kScreenHeight = UIScreen.mainScreen().bounds.size.height
let kScreenWidth = UIScreen.mainScreen().bounds.size.width
```

## 网络请求

#### 融合第三方

carthage || cocoapods //第三方 工具 融合第三方的基础 速度慢

1 moya 网络3次封装

2 Alamofire is an HTTP networking library written in Swift 2次封装

3 MBProgressHUD 提示

使用 方法 https://www.jianshu.com/p/2ab5dc80090b

4 Kingfisher 加载网络图片，类似SDWebImage

更多 ： https://www.jianshu.com/p/f4282df18537

#### 问题

enum  extension https://www.jianshu.com/p/9c7a07163e5b

**枚举、结构体、类** https://www.jianshu.com/p/78a6a4941516

switch 强大了 https://lingenliu.com/2017/07/18/the-simple-book-of-swift4-control-flow/

参数中 下划线的魔力 https://blog.csdn.net/ZY_FlyWay/article/details/79345675

RxSwift

## 数据解析

SwiftyJSON

问题 数据解析过程中 数组嵌套数组



```c++
print('hello')
```



``````swift
  for detail in jsonData["data"]["playlist"].arrayValue {
//
            let item = SongDetailModel(jsonData: detail)
            songDetails.append(item)
        }

// 声明
    var songDetails : [SongDetailModel]  = []

``````

##性能问题

##自定义cell

#### 问题

1   required init?(coder aDecoder: NSCoder) {

​        fatalError("init(coder:) has not been implemented")

​    }

cell 自定义过程中，这段代码的作用

2  as? 关键字 https://www.cnblogs.com/dukework/p/6553714.html



## 功能-登陆

LoginViewController

应用OC 之前的编写思路 用Swift 实现

### 问题

array 数据问题

## 网络图片加载

### 问题

ImageDataProvider

##多线程

https://www.jianshu.com/p/7e2e257b7662



## RXSwift

1. 

[RxSwift 官网]: https://github.com/ReactiveX/RxSwift

2.  翻译 

 

## 语言基础 

https://www.jianshu.com/p/78a6a4941516 枚举 enum、struct、class三者异同