//
//  NewsInfo.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/2/1.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit

class NewsInfo: NSObject {

    var title: String!
    var date: String!
    var thumbnail: String!
    
    func initWithParam(mtitle: String, mdate: String, thumb:String) {
        self.title = mtitle
        self.date = mdate
        self.thumbnail = thumb
    }
    
}
