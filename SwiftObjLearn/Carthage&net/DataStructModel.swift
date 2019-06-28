//
//  DataStructModel.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/27.
//  Copyright © 2019 tongbin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct DataStructModel {
    var systemTime:String?
    var curTime:String?
    var songDetails : [SongDetailModel]  = []
    init(jsonData:JSON) {
        //init
        systemTime = jsonData["data"]["systemtime"].stringValue
        curTime = jsonData["data"]["curtime"].stringValue
        for detail in jsonData["data"]["playlist"].arrayValue {
//
            let item = SongDetailModel(jsonData: detail)
            songDetails.append(item)
        }
       }
}

struct SongDetailModel {
    var songName :String?
    var songID : String?
    var songSingerName: String?
    init(jsonData:JSON) {
        songName = jsonData["xsong_name"].stringValue
        songID = jsonData["xqusic_id"].stringValue
        songSingerName = jsonData["xsinger_name"].stringValue

    }
}

