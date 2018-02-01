//
//  News.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/1/29.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var title: String?
    var date: String?
    var thumbnail: String?
    var newSource: String
    
    init(_title:String, _date:String, _thumb:String, _source:String) {
        title = _title
        date = _date
        thumbnail = _thumb
        newSource = _source
    }
}
