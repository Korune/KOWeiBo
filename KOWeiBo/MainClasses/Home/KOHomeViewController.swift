//
//  KOHomeViewController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

class KOHomeViewController: KOBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        view.addSubview(button)
        button.setTitle("Push", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(testPush), for: .touchUpInside)
        button.center = view.center
    }

    @objc func testPush() {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }
}


