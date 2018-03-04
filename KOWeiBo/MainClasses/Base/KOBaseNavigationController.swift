//
//  KOBaseNavigationController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

class KOBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 如果滑动移除控制器的功能失效(由于自定义了 viewController.navigationItem.leftBarButtonItem)，清空代理(让导航控制器重新设置这个功能)
        
        interactivePopGestureRecognizer?.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 在 push 前，进行一些处理
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            let button: UIButton = UIButton.ko_textButton(withTitle: "返回", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
            let imageName = "navigationbar_back_withtext"
            button.setImage(UIImage(named: imageName), for: .normal)
            button.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            button.sizeToFit()
            button.addTarget(self, action: #selector(popToParent), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func popToParent() {
        popViewController(animated: true)
    }
}
