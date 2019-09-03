//
//  LoginViewController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/28.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView :UITableView!
    var views  : [UIView]  = []
    var v = CustomView()
    var  v2 = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "Login"
        self.buildListView()
        self.buildContent()
    }
    
    private func buildListView() {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        self.view.addSubview(tableView)
        let bottom = UIButton.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 66))
        bottom.setTitle("提交", for: .normal)
        bottom.setTitleColor(.red, for: .normal)
        bottom.addTarget(self, action: #selector(submit(button:)), for: .touchUpInside)
        self.tableView.tableFooterView = bottom
    }
    
    
    @objc func submit(button:UIButton) {
        print(self.v.textfield.text ?? "defualt", self.v2.textfield.text ?? "defualt")
    }
    
    private func buildContent() {
        self.v = LoginViewManager.makeTextLoginView(title: "USERNAME", placeHolder:"INPUTYOURUSERNAME" )
        self.v2 = LoginViewManager.makeTextLoginView(title: "PASSWORD", placeHolder:"INPUTYOURPASSWORD" )
        let divid = LoginViewManager.makeDividView()
        self.views.append(v)
        self.views.append(divid)
        self.views.append(v2)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.views.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        
        var cell:NormalTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)as?NormalTableViewCell
        if cell == nil {
            cell = NormalTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell.accessoryView = self.views[indexPath.row]
        cell.setNeedsLayout()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let view = self.views[indexPath.row] 
        return view.height
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
