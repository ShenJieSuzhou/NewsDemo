//
//  News.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/1/29.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var title : String?
    var date : String?
    var thumbnail :String?
    
    init(_title:String, _date:String, _thumb:String ) {
        title = _title
        date = _date
        thumbnail = _thumb
    }
}
