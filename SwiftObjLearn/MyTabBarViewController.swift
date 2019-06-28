//
//  MyTabBarViewController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/24.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }
    private func addChildViewControllers() {
        setChildViewController(FirstViewController(), title: "first", imageName: "")
        setChildViewController(SecondViewController(), title: "second", imageName: "")
    }

    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
//        childController.tabBarItem.image = UIImage(named: imageName)
        childController.title = title
        let navVc = MyNavViewController(rootViewController: childController)
        addChild(navVc)
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
