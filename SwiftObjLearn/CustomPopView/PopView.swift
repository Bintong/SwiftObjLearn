//
//  PopView.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/24.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

protocol PopViewDelegate {
    func function_one(strMessage:String) -> ()
}


class PopView: UIView {
/********************闭包demo**********************************************************/
    //block
    typealias swiftBlock = (_ btTag:Int) ->Void
    //block instance
    var callBack: swiftBlock?
    // func
    func callBackBlock(block:@escaping swiftBlock) {
        callBack = block
    }
/*****************************************************************************************/
/********************代理demo**********************************************************/
    //顶部
    var delegate: PopViewDelegate?
/*****************************************************************************************/

    
    
    var contentView:UIView?
    {
        didSet {
            setupContent()
        }
    }
    
    var numBt = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent()  {
        if self.contentView != nil {
            self.contentView?.y = self.height
            self.addSubview(self.contentView!)
        }
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismisView)))
    }
    
    @objc func dismisView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
            self.contentView?.removeFromSuperview()
        }
    }
    
    func showInView(view:UIView) {
        if (contentView == nil) {
            return
        }
        view.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
            self.contentView?.y = self.height - (self.contentView?.height)!
        }, completion: nil)
    }
    
    private func makeBts() {
        for i in 0...numBt {
            let button = UIButton(frame: CGRect(x: 0 + 65 * i, y: 100, width: 60, height: 20))
            let titleStr = NSString(format: "NO . %d", i)
            button.setTitle(titleStr as String, for: .normal)
            
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1.0
            button.setTitleColor(UIColor.red, for: .normal)
            button.tag = i
            self.contentView?.addSubview(button)
            button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
            
        }
    }
    
    func showInWindow(num: NSInteger) {
        self.numBt = num
        self.makeBts()
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
            self.contentView?.y = self.height - (self.contentView?.height)!
        }, completion: nil)
    }
    
    @objc func buttonClick(button:UIButton) {
        //1 block
        if button.tag == 0 || button.tag == 1 {
            //block
            if callBack != nil {
                callBack!(button.tag)
            }
        } else if button.tag == 2 || button.tag == 3 {
            delegate?.function_one(strMessage: "\(button.tag)")
        }
        
    }
    
  

}
