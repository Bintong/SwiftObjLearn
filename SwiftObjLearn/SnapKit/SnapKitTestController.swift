//
//  SnapKitTestController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/8/7.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitTestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.makeView_3()

        // Do any additional setup after loading the view.
    }
}

extension SnapKitTestController {
//    center1
    func makeView_1() {
        let textView = UIView()
        textView.backgroundColor = .red
        self.view.addSubview(textView)
        textView.snp.makeConstraints{
            (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(view)
        }
    }
//    center2
    func makeView_2()  {
        let textView = UIView()
        textView.backgroundColor = .red
        self.view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
//    View2位于View1内， view2位于View1的中心， 并且距离View的边距的距离都为20
    func makeView_3()  {
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view1.center = self.view.center
        self.view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = .orange
        view1.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.bottom).offset(10)
            make.width.height.equalTo(100)
//            水平中心线<=view1的左边
            make.centerX.lessThanOrEqualTo(view1.snp.leading)
        }
        
        
    }
}
