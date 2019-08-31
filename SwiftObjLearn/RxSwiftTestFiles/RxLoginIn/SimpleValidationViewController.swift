//
//  SimpleValidationViewController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/8/11.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SimpleValidationViewController: UIViewController {

    @IBOutlet var usrnameOutlet: UITextField!
    @IBOutlet var usernameValidOutlet: UILabel!
    @IBOutlet var passwordOutlet: UITextField!
    @IBOutlet var passwordValidOutlet: UILabel!

    @IBOutlet weak var doSomethingOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameValidOutlet.text = "Username has to be at least \(5) characters"
        passwordValidOutlet.text = "Password has to be at least \(5) characters"
        
        // 用户名是否有效
        let usrnameValid = usrnameOutlet.rx.text.orEmpty.map {$0.count >= 5}.share(replay: 1)
         // 用户名是否有效 -> 密码输入框是否可用
        usrnameValid.bind(to: passwordOutlet.rx.isEnabled).disposed(by: rx.disposeBag)
        // 用户名是否有效 -> 用户名提示语是否隐藏
        usrnameValid.bind(to: usernameValidOutlet.rx.isHidden).disposed(by: rx.disposeBag)
            
        // 密码是否有效
        let passwordValid = passwordOutlet.rx.text.orEmpty.map{$0.count >= 5}.share(replay: 1)
        // 密码是否有效 -> 密码提示语是否隐藏
        passwordValid.bind(to: passwordValidOutlet.rx.isHidden).disposed(by: rx.disposeBag)
        
        // 所有输入是否有效
        let everythingVaild = Observable.combineLatest(usrnameValid, passwordValid) { $0 && $1 }.share(replay: 1)
        everythingVaild.bind(to: doSomethingOutlet.rx.isEnabled).disposed(by: rx.disposeBag)
        
        doSomethingOutlet.rx.tap.bind( onNext :{ [weak self] in
            self?.showAlert()
        })  
            .disposed(by: rx.disposeBag)
 
        
       
        // Do any additional setup after loading the view.
    }

    func showAlert() {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        alertView.show()
        
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
