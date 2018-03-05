//
//  KOVisitorView.swift
//  KOWeiBo
//
//  Created by Korune on 2018/3/4.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

class KOVisitorView: UIView {

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 私有控件
    private lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var houseImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var registerButton: UIButton = UIButton.ko_textButton(withTitle: "注册",
                                                                       fontSize: 16,
                                                                       normalColor: UIColor.orange,
                                                                       highlightedColor: UIColor.darkGray,
                                                                       backgroundImage: UIImage(named:"common_button_white_disable"))
    private lazy var loginButton: UIButton = UIButton.ko_textButton(withTitle: "登录",
                                                                       fontSize: 16,
                                                                       normalColor: UIColor.darkGray,
                                                                       highlightedColor: UIColor.black,
                                                                       backgroundImage: UIImage(named:"common_button_white_disable"))
    /// 遮罩图像 - 不要使用 maskView
    private lazy var maskImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
}

extension KOVisitorView {
    
    private func setupUI() {
        // 0. 在开发的时候，如果能够使用颜色，就不要使用图像，效率会更高！
        backgroundColor = UIColor.ko_color(withHex: 0xEDEDED)
        
        // 1. 添加控件
        addSubview(iconImageView)
        addSubview(maskImageView)
        addSubview(houseImageView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 2. 取消 autoresizing
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 3. 自动布局
        // "view1.attr1 = view2.attr2 * multiplier + constant"
        let margin: CGFloat = 40
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -60))
        
        addConstraint(NSLayoutConstraint(item: houseImageView, attribute: .centerX, relatedBy: .equal, toItem: iconImageView, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseImageView, attribute: .centerY, relatedBy: .equal, toItem: iconImageView, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .centerX, relatedBy: .equal, toItem: houseImageView, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .centerY, relatedBy: .equal, toItem: houseImageView, attribute: .bottom, multiplier: 1, constant: margin))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 236))
        
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .leading, relatedBy: .equal, toItem: tipLabel, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1, constant: margin))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .trailing, relatedBy: .equal, toItem: tipLabel, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1, constant: margin))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
        
        // VFL 添加 maskImageView 约束
        let views = ["maskImageView" : maskImageView,
                     "registerButton" : registerButton] as [String : Any]
        let metrics = ["spacing" : 20]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskImageView]-0-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskImageView]-(spacing)-[registerButton]", options: [], metrics: metrics, views: views))
    }
}
