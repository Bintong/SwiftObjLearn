//
//  FirstViewController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/24.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var names = ["基本控件","网络请求","Login","车辆信息","RXSwift","f","g","h"];
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerLabel.text = "Header"
        self.tableView?.tableHeaderView = headerLabel;
        self.view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let detail =  DetailPushController()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(detail, animated: true)
        } else if indexPath.row == 1 {
            let net = TestNetViewController()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(net, animated: true)
        }  else if indexPath.row == 2 {
            let login = LoginViewController()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(login, animated: true)
        } else if indexPath.row == 3 {
            let infoCtr = CarInfoInputController()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(infoCtr, animated:true)
        }else {
            let cell = tableView.cellForRow(at: indexPath)
            if cell?.accessoryType == UITableViewCell.AccessoryType.none {
                cell?.accessoryType = .checkmark
                print("您的选择 是 ： \(String(describing: cell?.textLabel?.text))")
            } else {
                cell?.accessoryType = .none
            }
        }
      
    }
}

