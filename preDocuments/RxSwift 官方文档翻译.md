## 前提

原文链接

https://github.com/ReactiveX/RxSwift/blob/master/README.md

Rx是通过Observable <Element>接口表示的通用计算抽象。

试图尽可能多地从原始版本移植概念，但是一些概念适用于与iOS / macOS环境更加愉快和高效的集成。

可以在ReactiveX.io上找到跨平台文档。

KVO observing, async operations and streams 都在序列的抽象下统一。 这就是Rx如此简单，优雅和强大的原因

## 我是故我在



###### ... 学习理解

* [为什么用RX?](Documentation/Why.md)
* [基础入门rxSwift](Documentation/GettingStarted.md)
* [traits](Documentation/Traits.md) - what are `Single`, `Completable`, `Maybe`, `Driver`, and `ControlProperty` ... 他们为什么存在?
* [测试](Documentation/UnitTests.md)
* [提示&常见错误](Documentation/Tips.md)
* [debugging](Documentation/GettingStarted.md#debugging)
* [Rx背后的数学](Documentation/MathBehindRx.md)
* [什么是冷热observable sequences](Documentation/HotAndColdObservables.md)

###### ... 安装

* 安装 RxSwift/RxCocoa  在app 中. [Installation Guide](#installation)

###### ... hack around

* 例子. [Running Example App](Documentation/ExampleApp.md)
* playgrounds. [Playgrounds](Documentation/Playgrounds.md)

###### ... 交流

* 口口相传 ，讲述 使用RxSwift 的经验 和心得 <br />[Join Slack Channel](http://slack.rxswift.org)
* 上传错误 用这个library. [Open an Issue With Bug Template](.github/ISSUE_TEMPLATE.md)
* 要求新功能. [Open an Issue With Feature Request Template](Documentation/NewFeatureRequestTemplate.md)
* 帮助 [Check out contribution guide](CONTRIBUTING.md)

###### ... 比较

* [和其他的libraries](Documentation/ComparisonWithOtherLibraries.md).

###### ... 了解架构

RxSwift包含五个独立的组件，具体相互依赖关系如下：

```none
┌──────────────┐    ┌──────────────┐
│   RxCocoa    ├────▶   RxRelay    │
└───────┬──────┘    └──────┬───────┘
        │                  │        
┌───────▼──────────────────▼───────┐
│             RxSwift              │
└───────▲──────────────────▲───────┘
        │                  │        
┌───────┴──────┐    ┌──────┴───────┐
│    RxTest    │    │  RxBlocking  │
└──────────────┘    └──────────────┘
```



* **RxSwift**:  RxSwift的核心 主要由[ReactiveX](https://reactivex.io) 提供Rx基础, 别无其它依赖
* **RxCocoa**: 为iOS/macOS/watchOS/tvOS 应用程序开发提供Cocoa特定功能 依赖`RxRelay` 和 `RxSwift`
* **RxRelay**: 提供 `PublishRelay` and `BehaviorRelay`, 两个 [simple wrappers around Subjects](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Subjects.md#relays). 依靠 `RxSwift`. 
* **RxTest** and **RxBlocking**:为Rx的系统提供测试功能. 他们依靠 `RxSwift`.

###### ... 寻找兼容

* libraries from [RxSwiftCommunity](https://github.com/RxSwiftCommunity). 社区
* [Pods using RxSwift](https://cocoapods.org/?q=uses%3Arxswift).

###### ... 愿景

* 安卓? [RxJava](https://github.com/ReactiveX/RxJava)

* 这一切的未来是什么, reactive 架构为何物, 如何以这样的方式设计整个app?

   [Cycle.js](https://github.com/cyclejs/cycle-core) - 这是 javascript, 但是 [RxJS](https://github.com/Reactive-Extensions/RxJS) i是Rx 的js版本.

## 使用

<table>
  <tr>
    <th width="30%">例子</th>
    <th width="30%">动态效果</th>
  </tr>
  <tr>
    <td>GitHub 库搜索 ...</td>
    <th rowspan="9"><img src="https://raw.githubusercontent.com/kzaher/rxswiftcontent/master/GithubSearch.gif"></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
let searchResults = searchBar.rx.text.orEmpty
    .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
    .distinctUntilChanged()
    .flatMapLatest { query -> Observable&lt;[Repository]&gt; in
        if query.isEmpty {
            return .just([])
        }
        return searchGitHub(query)
            .catchErrorJustReturn([])
    }
    .observeOn(MainScheduler.instance)</pre></div></td>
  </tr>
  <tr>
    <td>... 然后绑定数据结构和你的tableview</td>
  </tr>
  <tr>
    <td width="30%"><div class="highlight highlight-source-swift"><pre>
searchResults
    .bind(to: tableView.rx.items(cellIdentifier: "Cell")) {
        (index, repository: Repository, cell) in
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.url
    }
    .disposed(by: disposeBag)</pre></div></td>
  </tr>
</table>

## 要求 

* Xcode 10.2
* Swift 5.0

对于 Xcode 10.1以及更低版本 , [use RxSwift 4.5](https://github.com/ReactiveX/RxSwift/releases/tag/4.5.0).

## 安装

Rx 不依赖第三方.

以下几种安装方式:

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
end

# RxTest and RxBlocking make the most sense in the context of unit/integration tests
target 'YOUR_TESTING_TARGET' do
    pod 'RxBlocking', '~> 5'
    pod 'RxTest', '~> 5'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

### [Carthage](https://github.com/Carthage/Carthage)

Officially supported: Carthage 0.33 and up.

Add this to `Cartfile`

```
github "ReactiveX/RxSwift" ~> 5.0
```

```bash
$ carthage update
```

#### Carthage as a Static Library

Carthage defaults to building RxSwift as a Dynamic Library. 

If you wish to build RxSwift as a Static Library using Carthage you may use the script below to manually modify the framework type before building with Carthage:

```bash
carthage update RxSwift --platform iOS --no-build
sed -i -e 's/MACH_O_TYPE = mh_dylib/MACH_O_TYPE = staticlib/g' Carthage/Checkouts/RxSwift/Rx.xcodeproj/project.pbxproj
carthage build RxSwift --platform iOS
```

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "RxTestProject",
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
  ],
  targets: [
    .target(name: "RxTestProject", dependencies: ["RxSwift", "RxCocoa"])
  ]
)
```

```bash
$ swift build
```

To build or test a module with RxTest dependency, set `TEST=1`.

```bash
$ TEST=1 swift test
```

### Manually using git submodules

* Add RxSwift as a submodule

```bash
$ git submodule add git@github.com:ReactiveX/RxSwift.git
```

* Drag `Rx.xcodeproj` into Project Navigator
* Go to `Project > Targets > Build Phases > Link Binary With Libraries`, click `+` and select `RxSwift-[Platform]` and `RxCocoa-[Platform]` targets

## 相关链接

* [http://reactivex.io/](http://reactivex.io/)
* [Reactive Extensions GitHub (GitHub)](https://github.com/Reactive-Extensions)
* [RxSwift RayWenderlich.com Book](https://store.raywenderlich.com/products/rxswift-reactive-programming-with-swift)
* [Boxue.io RxSwift Online Course](https://boxueio.com/series/rxswift-101) (Chinese 🇨🇳)
* [Erik Meijer (Wikipedia)](http://en.wikipedia.org/wiki/Erik_Meijer_%28computer_scientist%29)
* [Expert to Expert: Brian Beckman and Erik Meijer - Inside the .NET Reactive Framework (Rx) (video)](https://youtu.be/looJcaeboBY)
* [Reactive Programming Overview (Jafar Husain from Netflix)](https://www.youtube.com/watch?v=dwP1TNXE6fc)
* [Subject/Observer is Dual to Iterator (paper)](http://csl.stanford.edu/~christos/pldi2010.fit/meijer.duality.pdf)
* [Rx standard sequence operators visualized (visualization tool)](http://rxmarbles.com/)
* [Haskell](https://www.haskell.org/)
