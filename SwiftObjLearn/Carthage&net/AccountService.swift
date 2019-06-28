//
//  AccountService.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/26.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import Moya
//第一步：为你所用的API目标创建一个enum
enum API {
    case getCityCode(code:Int)
    case loginApi(phone:String, password:String)
    case testApi
}
//2实现方法
extension API:TargetType {
    // 2.1 base url
    var baseURL: URL {
        return URL.init(string: "https://www.sojson.com/api/")!
    }
    // 2.2 deail url
    var path: String {
        switch self {
        case .getCityCode:
            return "base/getCode"
        case .loginApi:
            return "base/auth/login"
       
        case .testApi:
            return "qqmusic/8446666"
        }
    }
    // 2.3 method get / post
    var method: Moya.Method {
        switch self {
        case .getCityCode:
            return .get
        case .loginApi:
            return .post
        case .testApi:
            return .get
        }
    }
    //2. 4 data 格式
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    //2.5 参数
    var task: Task {
        switch self {
        case let .getCityCode(code: citycode):
            return .requestParameters(parameters: ["cityCode" : citycode], encoding: URLEncoding.queryString)
        case .loginApi(let phone, let password):
            return .requestParameters(parameters: ["phone" : phone , "passworld" : password], encoding: URLEncoding.default)
        case .testApi :
            return .requestPlain
        }
    }
    // 2.6  header setting
    var headers: [String : String]? {
        switch self {
        case .getCityCode:
            return ["key":"value"]
        case .loginApi:
            return ["key":"value"]
        case .testApi:
            return  ["Content-Type": "application/json"]
        }
    }
    
    //  3 真正的方法 请求 fail and success
    func netWork() {
        let netProvider = MoyaProvider<API>()
        netProvider.request(.getCityCode(code: 1)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                print(data)
                print(statusCode)
            case let  .failure(error):
                print(error)
            }
        }
    }
    
   
}
    


