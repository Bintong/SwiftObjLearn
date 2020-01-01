//
//  Config.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/9/3.
//  Copyright © 2019 tongbin. All rights reserved.
//

import Foundation
import UIKit
let isIPhoneX: Bool = fScreenHeight >= 812 ? true : false

/// 屏幕的宽度
let fScreenWidth = UIScreen.main.bounds.width

/// 屏幕的高度
let fScreenHeight = UIScreen.main.bounds.height

/// 状态栏高度
let fStatusBarHeight: CGFloat = fIsIPhoneX ? 44 : 20

/// TODO: 是否是iphoneX ，需要支持xs，plus
let fIsIPhoneX: Bool = fScreenHeight >= 812 ? true : false

/// 导航栏高度
let fStatusAndNavBarHeight: CGFloat = fIsIPhoneX ? 88 : 64

/// Tabbar高度
let fTabbarHeight: CGFloat = fIsIPhoneX ? 83 : 49

///底部安全高度
let fSafeAreBottom: CGFloat = fIsIPhoneX ? 34 : 0
