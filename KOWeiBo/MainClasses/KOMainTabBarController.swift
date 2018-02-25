//
//  KOMainTabBarController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/20.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

class KOMainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupChildControllers()
        setupComposeButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // @objc 允许这个函数在运行时通过 OC 的消息机制被调用
    @objc fileprivate func composeStatus() {
        NSLog("撰写微博")
    }
    
    // MARK: -
    /// 撰写微博按钮
    fileprivate lazy var composeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        button.setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        button.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for:.highlighted)
        
        return button
    }()
}

extension KOMainTabBarController {
    
    fileprivate func setupChildControllers() {
        let infos = [
            ["clsName" : "KOHomeViewController", "title" : "首页", "imageName" : "tabbar_home"],
            ["clsName" : "KOMessageViewController", "title" : "消息", "imageName" : "tabbar_message_center"],
            ["clsName" : "UIViewController"],
            ["clsName" : "KODiscoverViewController", "title" : "发现", "imageName" : "tabbar_discover"],
            ["clsName" : "KOProfileViewController", "title" : "我", "imageName" : "tabbar_profile"]
        ]
        var vcs = [UIViewController]()
        for dict in infos {
            vcs.append(controller(dict: dict))
        }
        viewControllers = vcs
    }
    
    /// 从字典加载 ViewControlelr
    fileprivate func controller(dict: [String : String]) -> UIViewController {
        guard let className = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.ko_namespace + "." + className) as? KOBaseViewController.Type
            
            else {
                return UIViewController();
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor : UIColor.orange],
            for: .selected)
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)],
            for:.normal)
        
        let nav = KOBaseNavigationController(rootViewController: vc)
        return nav
    }
    
    fileprivate func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        let count = childViewControllers.count
        // 减1是为了，将按钮的宽度变大盖住容错点，防止穿帮
        let w = tabBar.bounds.width / CGFloat(count) - 1
        composeButton.frame = tabBar.bounds.insetBy(dx: w * 2, dy: 0) // 类似 CGRectInset 的使用，正数向内缩进，负数向外扩展
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
}
