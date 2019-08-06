//
//  SubscribViewController.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/6.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SubscribViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        1方法
        let ob = Observable.of(1,2,3)
        ob.subscribe{
            event in print(event.element)
        }
        
//        2 可以不同e的block 回调处理不同的类型event event 打印出来
        ob.subscribe(onNext: { event in
            print(event)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("Disposed")
        })
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
