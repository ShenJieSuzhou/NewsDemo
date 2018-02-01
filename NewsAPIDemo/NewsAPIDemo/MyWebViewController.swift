//
//  MyWebViewController.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/2/1.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit

class MyWebViewController: UIViewController {
    
    var newsUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(webView)
        let request = URLRequest(url: URL(string: newsUrl)!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //懒加载，创建标题
    lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.frame = self.view.bounds
        
        return webView
    }()

    func setUrl(url:String) -> Void {
        newsUrl = url
    }
}
