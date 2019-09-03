//
//  LoginViewManager.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/9/1.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var textfield = UITextField()
    
}

class LoginViewManager: NSObject {
    class func makeTextLoginView(title:String, placeHolder:String) -> CustomView {
        let v = CustomView.init(frame:(CGRect(x: 0, y: 0, width: kScreenWidth, height: 110)))
        let lableft = UILabel.init(frame: CGRect(x: 0, y: 0, width: 96, height: 30))
        lableft.text = title
        v.addSubview(lableft)
        let text = UITextField.init(frame: CGRect(x: 10, y: 40, width: kScreenWidth - 20, height: 40))
        text.placeholder = placeHolder
        v .addSubview(text)
        v.backgroundColor = .red
        v.textfield = text
        return v
    }
    
    class func makeDividView() -> CustomView{
        let v = CustomView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
        v.backgroundColor = .white
        return v
    }
    
    
}
