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
//        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(thumbImage)
    }

    //懒加载，创建标题
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 20, y: 10, width: 200, height: 60)
        titleLabel.text = ""
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    //懒加载，创建日期
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.frame = CGRect(x: 20, y: 70, width: 200, height: 20)
        dateLabel.text = ""
        dateLabel.textColor = UIColor.black
        dateLabel.font = UIFont.systemFont(ofSize: 10.0)
        dateLabel.textAlignment = .left
        return dateLabel
    }()
    
    //懒加载，创建缩略图
    lazy var thumbImage: UIImageView = {
        let thumbImage = UIImageView()
        thumbImage.frame = CGRect(x: 250, y: 10, width: 150, height: 80)
        thumbImage.contentMode = .scaleToFill
        
        return thumbImage
    }()
}
