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
    /// 用户登录标记
    var userLogon = false
    /// 访客视图信息字典
    var visitorInfo: [String: String]?
    
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
        userLogon ? setupTableView() : setupVisitorView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    @objc func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    private func setupVisitorView() {
        let visitorView = KOVisitorView(frame: view.bounds)
        view.addSubview(visitorView)
        visitorView.visitorInfo = visitorInfo
        
        /*
         使用代理与 addTarget 方法的讨论：
         1. 使用代理传递消息是为了在控制器和视图之间的解耦，让视图能够被多个控制器复用，例如 UITableView。
         2. 但是如果视图仅仅为了代码封装，而从控制器中剥离出来，并确认该视图不会被其他控制器引用，则可以直接使用 addTarget 方法为该视图添加监听方法。
         3. 使用 addTarget 的代价是耦合度搞，控制器和视图绑定在一起，但是会省略部分冗余代码。
         */
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(register))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: .plain, target: self, action: #selector(login))
    }
}

extension KOBaseViewController {
    
    @objc private func login() {
        NSLog("点击了登陆按钮")
    }
    
    @objc private func register() {
        NSLog("点击了注册按钮")
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
