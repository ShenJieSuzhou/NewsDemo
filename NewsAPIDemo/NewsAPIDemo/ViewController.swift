//
//  ViewController.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/1/29.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataArray = [News]()
    var tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "新闻头条"
        setupTableView()
        requestNewsAPI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //请求新闻数据
    func requestNewsAPI() {
        let url = "http://v.juhe.cn/toutiao/index?type=top&key=92d7759f604c067117f975624fdd5185"
        weak var weakSelf = self
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                
                if let json = response.result.value {
                    let dict = JSON(json)
                    let data =  dict["result"]["data"].arrayValue
        
                    weakSelf?.paraseNewsInfo(data)
                }
        }
    }
    
    //解析新闻数据
    func paraseNewsInfo(_ dateArray: [JSON]) {
        print(dateArray)
        for item in dateArray {
            let title = item["title"].stringValue
            let date = item["date"].stringValue
            let thumbnail = item["thumbnail_pic_s"].stringValue
            let source = item["url"].stringValue
            
            let newsItem = News(_title: title, _date: date, _thumb: thumbnail, _source:source)
            dataArray.append(newsItem)
        }
        
        tableView.reloadData()
    }
    
    //创建 tableview
    private func setupTableView(){
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.classForCoder(), forCellReuseIdentifier: "swiftCell")
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let webView = MyWebViewController()
        webView.setUrl(url: dataArray[indexPath.row].newSource)
        self.navigationController?.pushViewController(webView, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0;
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "swiftCell") as! NewsTableViewCell
        
        newsCell.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100)
        newsCell.titleLabel.text = dataArray[indexPath.row].title
        newsCell.dateLabel.text = dataArray[indexPath.row].date
        newsCell.thumbImage.kf.setImage(with: URL(string: dataArray[indexPath.row].thumbnail!))
        
        return newsCell;
    }
}

