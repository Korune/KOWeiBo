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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension KOMainTabBarController {
    
    fileprivate func setupChildControllers() {
        let infos = [
            ["clsName" : "KOHomeViewController", "title" : "首页", "imageName" : "tabbar_home"],
            ["clsName" : "KOMessageViewController", "title" : "消息", "imageName" : "tabbar_message_center"],
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
            for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)],
            for:.normal)
        
        let nav = KOBaseNavigationController(rootViewController: vc)
        return nav
    }
}
