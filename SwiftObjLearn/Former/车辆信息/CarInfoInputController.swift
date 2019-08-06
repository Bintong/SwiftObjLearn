//
//  CarInfoInputController.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/5.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class CarInfoInputController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    
    var tableView :UITableView!
    var views  : [UIView]  = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.createUI()
        self.buildContentViews()
    }
    func buildContentViews() {
        let headerImgs = CarInfoViewManager.createUploadImages()
        let carNumView = CarInfoViewManager.createNormalInfoView(title: "车牌号", placeHolder: "请先上传照片")
        let dividView_1 = CarInfoViewManager.createDividView()
        
        //车长/车型
        
        
        
        let typeCarView = CarInfoViewManager.createSelectedPickItemView(title: "车长/车型", right: "")
        let setUsuallyView = CarInfoViewManager.createSelectedPickItemView(title: "设置常用车辆", right: "")
        let dividView_2 = CarInfoViewManager.createDividView()


        let carheigtView = CarInfoViewManager.createNormalInfoView(title: "车高", placeHolder: "请输入车高（米）")
        
        let carWidthView = CarInfoViewManager.createNormalInfoView(title: "车宽", placeHolder: "请输入车宽（米）")
        let heigthView = CarInfoViewManager.createNormalInfoView(title: "核定载重", placeHolder: "请输入核定载重（千克）")
        let totoalNumView = CarInfoViewManager.createNormalInfoView(title: "车辆总量", placeHolder: "请输入车辆总重（千克）")
        let numBearingView = CarInfoViewManager.createNormalInfoView(title: "轴数", placeHolder: "请输入轴数")
        
        self.views.append(headerImgs)
        self.views.append(carNumView)
        self.views.append(dividView_1)
        self.views.append(typeCarView)
        self.views.append(setUsuallyView)
        self.views.append(dividView_2)
        self.views.append(carheigtView)
        self.views.append(carWidthView)
        self.views.append(heigthView)
        self.views.append(totoalNumView)
        self.views.append(numBearingView)
    }
}



extension CarInfoInputController{
    func createUI()  {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
//        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 230))
//        headerLabel.text = "Header-----------"
//        self.tableView?.tableHeaderView = headerLabel;
//        self.tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        self.view.addSubview(tableView)
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
    
}

