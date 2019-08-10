//
//  CarInfoViewManager.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/5.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit


class CarInfoView: UIView {
   
    var textfield = UITextField()
     
}


class CarInfoViewManager: NSObject {
    
    static let sharedInstance = CarInfoViewManager()
    
    class func createUploadImages() -> UIView {
        
        let bg_v = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 276));
        bg_v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let v = UIView.init(frame: CGRect(x: 12, y: 20, width: kScreenWidth - 24, height: 256))
        v.backgroundColor = UIColor.white
        bg_v .addSubview(v)

        let button_1 = UIButton.init(frame: CGRect(x: 12, y: 0, width: (kScreenWidth - 60)/2, height: 100))
        button_1.backgroundColor = UIColor.red
        v.addSubview(button_1)
        
        let button_2 = UIButton.init(frame: CGRect(x: button_1.right + 12, y: 0, width: (kScreenWidth - 60)/2, height: 100))
        button_2.backgroundColor = UIColor.red
        v.addSubview(button_2)
        
        let button_3 = UIButton.init(frame: CGRect(x: 12, y: button_1.bottom + 12, width: (kScreenWidth - 60)/2, height: 100))
        button_3.backgroundColor = UIColor.red
        v.addSubview(button_3)
        
        let button_4 = UIButton.init(frame: CGRect(x: button_1.right + 12, y: button_1.bottom + 12, width: (kScreenWidth - 60)/2, height: 100))
        button_4.backgroundColor = UIColor.red
        v.addSubview(button_4)
        
        return bg_v
        
    }
    
    class func createSelectedPickItemView(title:String, right:String) -> UIView {
        let bg_v = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49));
        bg_v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let v = UIView.init(frame: CGRect(x: 12, y: 0, width: kScreenWidth - 24, height: 49))
        v.backgroundColor = UIColor.white
        bg_v .addSubview(v)
        
       
        let label = UILabel.init()
        label.text = title as String
        label.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        label.frame = CGRect(x: 12, y: 0 , width: 70, height: 49)
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "PingFangSC-Regular", size: 14)
        
        v.addSubview(label)
        
        let rightIcon = UIImageView(image: UIImage(named: "icon_cellArrow-2"))
        rightIcon.x = v.width - 25
        rightIcon.y = 0
        rightIcon.centerY = v.height/2
        v .addSubview(rightIcon)
        
        return bg_v
    }
    
    class func createSetSeletedView(title:String, right:String) -> UIView {
        let bg_v = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49));
        bg_v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let v = UIView.init(frame: CGRect(x: 12, y: 0, width: kScreenWidth - 24, height: 49))
        v.backgroundColor = UIColor.white
        bg_v .addSubview(v)
        
        
        let label = UILabel.init()
        label.text = title as String
        label.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        label.frame = CGRect(x: 12, y: 0 , width: 120, height: 49)
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "PingFangSC-Regular", size: 14)
        
        v.addSubview(label)
        
        
        return bg_v
    }
    
    
    class func createSelectedUsuallyView(title:String, right:String) -> UIView {
        let bg_v = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49));
        bg_v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let v = UIView.init(frame: CGRect(x: 12, y: 0, width: kScreenWidth - 24, height: 49))
        v.backgroundColor = UIColor.white
        bg_v .addSubview(v)
        return bg_v
    }
    

    class func createDividView()->UIView {
        let v = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10));
        v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        return v
        
    }
    
    class func createNormalInfoView(title:String,placeHolder:String) -> CarInfoView {
        let bg_v = CarInfoView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49));
        bg_v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let v = UIView.init(frame: CGRect(x: 12, y: 0, width: kScreenWidth - 24, height: 49))
        v.backgroundColor = UIColor.white
        bg_v .addSubview(v)
        
        let label = UILabel.init()
        label.text = title as String
        label.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        label.frame = CGRect(x: 12, y: 0 , width: 70, height: 49)
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "PingFangSC-Regular", size: 14)

        v.addSubview(label)
        
        let textField = CarInfoViewManager.sharedInstance.makeTextField(placeHolder: placeHolder, target: AnyObject.self as AnyObject ,frame: CGRect(x: label.right + 12, y: 12, width: v.width - 24 - label.right, height: 36))
        textField.centerY = label.centerY
        v.addSubview(textField)
        return bg_v
        
    }
    
    internal func makeTextField(placeHolder:String,target:AnyObject ,frame:CGRect ) -> UITextField{
        let rightTextField = UITextField.init(frame:frame)
        rightTextField.backgroundColor = UIColor.white
//        rightTextField.borderStyle = UITextField.BorderStyle.roundedRect
        rightTextField.placeholder = placeHolder as String
        rightTextField.font = UIFont(name: "PingFangSC-Regular", size: 14)
        rightTextField.autocorrectionType = UITextAutocorrectionType.no
        rightTextField.returnKeyType = UIReturnKeyType.done
        rightTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        return rightTextField
    }
    
    internal func makeInfoLabel(text:String, font:UIFont,textColor:UIColor,frame:CGRect) -> UILabel {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 60, height: 49))
        label.text = text as String
        label.font = font
        label.textColor = textColor
        label.frame = frame
        label.textAlignment = NSTextAlignment.left
        return label
    }
}
