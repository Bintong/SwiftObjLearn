//
//  PeopleViewController.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/6.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class PeopleViewController: UIViewController {
    
    @IBOutlet weak var mytable: UITableView!
//    let peopleList = PeopleListModel()
    let disposeBag = DisposeBag()
    let peopleList = DataListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        peopleList.data.bind(to: mytable.rx.items(cellIdentifier: "myCell")) {_ , model, cell in
            cell.textLabel?.text = model.name

        }.disposed(by: disposeBag)
//        mytable.rx.modelSelected(DataModel.self).subscribe(onNext: {
//            people in print("selected \(people)")
//        }).disposed(by: disposeBag)
//
//
        mytable.rx.itemSelected.subscribe(onNext: { indexPath in
            switch indexPath.row {
            case 2:
                self.navigationController?.pushViewController(SubscribViewController.init(), animated: true)
                break
            case 3:
                self.navigationController?.pushViewController(doOnViewController.init(), animated: true)
            case 4:
                self.navigationController?.pushViewController(DisposeViewController.init(), animated: true)
                
            case 5:
                self.navigationController?.pushViewController(bindViewController.init(), animated: true)
            default:
                break
            }
        }
        )
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
