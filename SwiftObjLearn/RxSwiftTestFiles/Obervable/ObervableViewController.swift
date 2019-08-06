//
//  ObervableViewController.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/6.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum myError:Error {
    case errorA
    case errorB
}


class ObervableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        1 just（）
        let observable = Observable<String>.just("5")
        let observable2 = Observable.of("1","2","3","4","5")
        let observable3 = Observable.from(["1","2","3"])
        let observable4 = Observable<Int>.empty()
        let observable5 = Observable<Int>.never()
//        error
        let observable6 = Observable<Int>.error(myError.errorA)
        //range()创建一个范围的序列
        let observable7 = Observable.range(start: 1, count: 5)
//        8 repeatElement f无限发出event
        let observable8 = Observable.repeatElement(1)
//        9 generate() 判断条件都为true 的时候才会执行
        let observable9 = Observable.generate(
            initialState: 0, condition: { $0 <= 10 }, iterate:{ $0 + 2 })
//        10。create接受 block 参数
        let observable10 = Observable<String>.create { ob in
            ob.onNext("hello good")
            ob.onCompleted()
//            因为一个订阅的行为会有一个Disposables 类型的返回值，所以一定要在return 一个DDisposables
            return Disposables.create{}
        }
        
        //11 deferred() 创建一个工厂
        var isOdd = true
        let factory : Observable<Int> = Observable.deferred {
            isOdd = !isOdd
            if isOdd {
                return Observable.of(1,3,5,7)
            } else {
                return Observable.of(2,4,6,8)
            }
        }
        // 第一次订阅
        factory.subscribe{
            event in print("\(isOdd)",event)
        }
        
        // 第2次订阅
        factory.subscribe{
            event in print("\(isOdd)",event)
        }
        
        //12 interval()
        let ob = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        ob.subscribe {
            event in print(event)
        }
        
//        13 timer() 创建一个经过特定时间的 ，产生 唯一的元素
        let ob2 = Observable<Int>.timer(5, scheduler: MainScheduler.instance)
        ob2.subscribe{
            event in print("ob2---->",event)
        }
//        第二种 通过设定一段时间，每隔y一段时间产生一个原属 第一个参数 等待5秒，第二参数 每隔1秒参赛一个元素
        let ob3 = Observable<Int>.timer(5, period: 1, scheduler: MainScheduler.instance)
        
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
