//
//  KOBaseViewController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

class KOBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
}


// MARK: - 界面设置
extension KOBaseViewController {
    
    fileprivate func setupUI() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        
    }
}
