//
//  KOBaseViewController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

// 面试题：OC 中支持多继承吗？如果不支持，如何替代？答案：使用协议替代！
// Swift 的写法更类似于多继承！
//class WBBaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
// Swift 中，利用 extension 可以把`函数`按照功能分类管理，便于阅读和维护！
// 注意：
// 1. extension 中不能有属性
// 2. extension 中不能重写`父类`本类的方法！重写父类方法，是子类的职责，扩展是对类的扩展！

import UIKit

class KOBaseViewController: UIViewController {
    
    /// 如果用户没有登录，就不创建
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    /// 上拉刷新标记
    var isPullup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    /// 加载数据 - 具体的实现由子类负责
    @objc func loadData() {
        // 如果子类不实现任何方法，默认关闭刷新控件
        refreshControl?.endRefreshing()
    }
}

// MARK: - 界面设置
extension KOBaseViewController {
    
    private func setupUI() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
// 基类只是准备方法，子类负责具体的实现
// 子类的数据源方法不需要 super
extension KOBaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 只是保证没有语法错误！
        return UITableViewCell()
    }
    
    // 在显示最后一行的时候，做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {  
        let row = indexPath.row
        let section = indexPath.section
        let maxSection = tableView.numberOfSections - 1
        // 如果是最后一行，同时没有开始上拉刷新
        if section == maxSection && (row == tableView.numberOfRows(inSection: maxSection) - 1) && !isPullup {
            print("上拉刷新")
            isPullup = true
            loadData()
        }
    }
    
}
