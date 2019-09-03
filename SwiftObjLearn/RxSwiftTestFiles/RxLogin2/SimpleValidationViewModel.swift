//
//  SimpleValidationViewModel.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/9/2.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SimpleValidationViewModel {
    let usernameValid:Observable<Bool>
    let passwordValid:Observable<Bool>
    let everythingValid:Observable<Bool>
    
    init(username:Observable<String>, password:Observable<String>) {
        usernameValid = username.map { $0.count >= 5 }.share(replay:1)
        passwordValid = password.map { $0.count >= 5 }.share(replay:1)
        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
    }
    
}
