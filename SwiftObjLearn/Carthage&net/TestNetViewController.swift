//
//  TestNetViewController.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/27.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class TestNetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView :UITableView!
    var dataModel :DataStructModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "网络请求"
        self.testNet()
    }
    
    private func buildListView() {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        headerLabel.text = "Header-----------"
        self.tableView?.tableHeaderView = headerLabel;
        self.tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        self.view.addSubview(tableView)
    }
    
    
    let provider = MoyaProvider<API>()
    func testNet() {
        provider.request(.testApi) { result in
            switch result {
            case let .success(moyaResponse):
                let data_net = moyaResponse.data
                let code = moyaResponse.statusCode
                let json = JSON(data_net)
                let model = DataStructModel(jsonData: json)
                self.dataModel = model
                self.buildListView()
            case let  .failure(error):
                print(error)
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel.songDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        
        var cell:CustomCell! = tableView.dequeueReusableCell(withIdentifier: identifier)as?CustomCell
        if cell == nil {
            cell = CustomCell(style: .default, reuseIdentifier: identifier)
        }
        let detailModel = self.dataModel.songDetails[indexPath.row]
//        cell?.textLabel?.text = detailModel.songName
        cell.buildWithModel(model: detailModel)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
