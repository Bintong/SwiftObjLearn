//
//  PeopleViewModel.swift
//  SwiftObjLearn
//
//  Created by tongbin on 2019/8/6.
//  Copyright © 2019 tongbin. All rights reserved.
//

import Foundation
import RxSwift

struct PeopleListModel {
    let data = Observable.just([
        People(name: "张3", age: 14),
        People(name: "张4", age: 15),
        People(name: "张5", age: 17),
        People(name: "张6", age: 17),
        People(name: "张7", age: 16),
        People(name: "张8", age: 19),])
}


struct DataListModel {
    let data = Observable.just([
        DataModel(name: "tableView"),
        DataModel(name: "Observer"),
        DataModel(name: "Subscribe"),
        DataModel(name: "doOn"),
        DataModel(name: "dispose"),
        DataModel(name: "BindModel")])
}

