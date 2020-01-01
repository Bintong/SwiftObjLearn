//
//  PopSelectImgView.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/9/3.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

protocol PopSelectImgViewDelegate {
    func alertActionCancel()-> ()
    func alertActionTakePhoto()-> ()
    func alertActionLibrary()-> ()
}


class PopSelectImgView: UIView {
    //block
    typealias swiftBlock = (_ btTag:Int) ->Void
    static let `default` = PopSelectImgView()
    var delegate: PopSelectImgViewDelegate?    
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
    
    private func makeDetail(imgName:String) {
    
        let cancelBt = UIButton(frame: CGRect(x: 10, y: self.contentView!.height - 64, width: kScreenWidth - 20, height: 54))
        cancelBt.setTitle("取消", for: .normal)
        cancelBt.setTitleColor(UIColor(red: 0, green: 0.39, blue: 1, alpha: 1), for: .normal)
        cancelBt.titleLabel?.font = UIFont(name: "PingFang SC Regular", size: 18)
        cancelBt.backgroundColor = .white
        cancelBt.addTarget(self, action: #selector(cancelAction(button:)), for: .touchUpInside)

        self.contentView?.addSubview(cancelBt)
        
        let takePhoto = UIButton(frame: CGRect(x: 10, y: 0, width: kScreenWidth - 20, height: 54))
        takePhoto.setTitle("拍照", for: .normal)
        takePhoto.setTitleColor(UIColor(red: 0, green: 0.39, blue: 1, alpha: 1), for: .normal)
        takePhoto.titleLabel?.font = UIFont(name: "PingFang SC Regular", size: 18)
        takePhoto.backgroundColor = .white
        takePhoto.addTarget(self, action: #selector(takePhotoAction(button:)), for: .touchUpInside)
        self.contentView?.addSubview(takePhoto)
        
        let picker = UIButton(frame: CGRect(x: 10, y: 54, width: kScreenWidth - 20, height: 54))
        picker.setTitle("从相册选择", for: .normal)
        picker.setTitleColor(UIColor(red: 0, green: 0.39, blue: 1, alpha: 1), for: .normal)
        picker.titleLabel?.font = UIFont(name: "PingFang SC Regular", size: 18)
        picker.backgroundColor = .white
        picker.addTarget(self, action: #selector(pickFromLib(button:)), for: .touchUpInside)

        self.contentView?.addSubview(picker)
        
        let topImgContent = UIView(frame: CGRect(x: 24, y: 64 + fStatusAndNavBarHeight, width: kScreenWidth - 48, height: 333))
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: topImgContent.width, height: topImgContent.height))
        img.image = UIImage.init(named: imgName)
        topImgContent.addSubview(img)
        topImgContent.isHidden = false
        self.addSubview(topImgContent)
    }
    
    
    func showInWindow(imageName:String) {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.contentView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 178))
        self.contentView?.backgroundColor = .clear
//        self.numBt = num
        self.makeDetail(imgName: imageName)
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
            self.contentView?.y = self.height - (self.contentView?.height)! - fSafeAreBottom
        }, completion: nil)
    }
    
    @objc func cancelAction(button:UIButton) {
        delegate?.alertActionCancel()
    }
    
    @objc func takePhotoAction(button:UIButton) {
        delegate?.alertActionTakePhoto()
    }
    
    @objc func pickFromLib(button:UIButton) {
        delegate?.alertActionLibrary()
    }
}
