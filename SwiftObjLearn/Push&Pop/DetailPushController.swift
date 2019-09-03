//
//  DetailPushController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/24.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class DetailPushController: UIViewController,PopViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "基础控件"
        
        self.makeLabels()
        let bt = self.makeButton(title: "Hello")
        bt.addTarget(self, action:#selector(buttonClick_new(button:)), for: .touchUpInside)
//        button.addTarget(self, action: #selector(buttonClick(_button:)), for: .touchUpInside)

        self.view.addSubview(bt)
    }
    
    @objc func buttonClick_new(button:UIButton) {
        button.isSelected = !button.isSelected
        if button.isSelected {
            button.setTitle("Selected", for: .normal)
        } else {
            button.setTitle("No selected", for: .normal)
        }
    }
    
    
    func makeLabels(){
        let label = UILabel(frame: CGRect(x: 10, y: 100, width: 160, height: 30))
        label.backgroundColor = UIColor.green
        label.text = "123456 hello"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
    }
    
    func makeButton(title:String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 180, y: 200, width: 160, height: 40))
        button.setTitle("Button First", for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        button.setTitleColor(UIColor.red, for: .normal)
    
        return button
    }
    
    
    @objc func buttonClick(_button:UIButton){
        NSLog("button clicked")
        let pop = PopView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        pop.contentView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        pop.contentView?.backgroundColor = UIColor.orange
        pop.showInWindow(num: 5)
        pop.callBackBlock {
            (tag) in print(tag)
        }
        pop.delegate = self
    }
    
    func function_one(strMessage: String) {
        print(strMessage)
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
