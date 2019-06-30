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
        
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 230))
        headerLabel.text = "Header-----------"
        self.tableView?.tableHeaderView = headerLabel;
        self.tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        self.view.addSubview(tableView)
    }
    
    private func buildContent() {
        let view1 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40))
        view1.backgroundColor = UIColor.red
        let view2 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 60))
        view2.backgroundColor = UIColor.green
        let view3 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 80))
        view3.backgroundColor = UIColor.black
        let view4 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 100))
        view4.backgroundColor = UIColor.orange
        let view5 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 120))
        view5.backgroundColor = UIColor.purple
        let view6 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 140))
        view6.backgroundColor = UIColor.yellow
        let view7 = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 30))
        view7.backgroundColor = UIColor.blue
        
        self.views.append(view1)
        self.views.append(view2)
        self.views.append(view3)

        self.views.append(view4)
        self.views.append(view5)
        self.views.append(view6)
        self.views.append(view7)

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
