//
//  NewsTableViewCell.swift
//  NewsAPIDemo
//
//  Created by shenjie on 2018/1/29.
//  Copyright © 2018年 shenjie. All rights reserved.
//

import UIKit
import SnapKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI(){
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(thumbImage)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(superview!).offset(10)
            make.left.equalTo(superview!).offset(20)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(superview!).offset(10)
            make.left.equalTo(superview!).offset(20)
        }
        
        thumbImage.snp.makeConstraints { (make) in
            make.top.equalTo(superview!).offset(10)
            make.right.equalTo(superview!).offset(20)
        }
    }

    //懒加载，创建标题
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    //懒加载，创建日期
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = ""
        dateLabel.textColor = UIColor.black
        dateLabel.font = UIFont.systemFont(ofSize: 15.0)
        dateLabel.textAlignment = .left
        return dateLabel
    }()
    
    //懒加载，创建缩略图
    lazy var thumbImage: UIImageView = {
        let thumbImage = UIImageView()
        thumbImage.contentMode = .scaleAspectFill
        
        return thumbImage
    }()
}
