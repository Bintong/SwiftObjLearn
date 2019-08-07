//
//  CarInfoInputController.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/5.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import NSObject_Rx

let kBottomHeight: CGFloat = 70

class CarInfoInputController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    
    var tableView : UITableView!
    var views  : [UIView]  = []


 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        self.createUI()
        self.buildContentViews()
        self.creatBottomView()
    }
    
    
    lazy var carWidthView: CarInfoView = {
        let  v =  CarInfoViewManager.createNormalInfoView(title: "车宽", placeHolder: "请输入车宽（米）")
        return v
    }()
    
    lazy var carheigtView: CarInfoView = {
        let  v  = CarInfoViewManager.createNormalInfoView(title: "车高", placeHolder: "请输入车高（米）")
        return v
    }()
    
    lazy var heigthView: CarInfoView = {
        let  v  = CarInfoViewManager.createNormalInfoView(title: "核定载重", placeHolder: "请输入核定载重（千克）")
        return v
    }()
    
    lazy var totoalNumView: CarInfoView = {
        let  v  = CarInfoViewManager.createNormalInfoView(title: "车辆总量", placeHolder: "请输入车辆总重（千克）")
        return v
    }()
    
    lazy var numBearingView: CarInfoView = {
        let  v  = CarInfoViewManager.createNormalInfoView(title: "轴数", placeHolder: "请输入轴数")
        return v
    }()
    
    
    func buildContentViews() {
        let headerImgs = CarInfoViewManager.createUploadImages()
        let carNumView = CarInfoViewManager.createNormalInfoView(title: "车牌号", placeHolder: "请先上传照片")
        let dividView_1 = CarInfoViewManager.createDividView()
        
        //车长/车型
        let typeCarView = CarInfoViewManager.createSelectedPickItemView(title: "车长/车型", right: "")
        let setUsuallyView = CarInfoViewManager.createSetSeletedView(title: "设置常用车辆", right: "")
        let dividView_2 = CarInfoViewManager.createDividView()

       
        
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
    
    func makeParameters() ->NSDictionary{
        let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        return airports as NSDictionary
    }
}

extension CarInfoInputController{
    
    
    
    func createUI()  {
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        self.tableView.height = kScreenHeight - kBottomHeight - 64
        self.view.addSubview(tableView)
    }
    
    func creatBottomView()  {
        let view = UIView.init(frame: CGRect(x: 0, y: kScreenHeight - kBottomHeight - 64 - 44, width: kScreenWidth, height: kBottomHeight))
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        let button = UIButton.init(frame: CGRect(x: 12, y: 12, width: kScreenWidth - 24, height: 50))
        button.setTitleColor(.white, for: .normal)
        button.setTitle("保存", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        button.rx.tap.subscribe(onNext:  { recognizer in
            print("点击")
        }).disposed(by: rx.disposeBag)
        
        self.view.addSubview(view)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

