//
//  KOHomeViewController.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

import UIKit

private let cellID = "cellID";

class KOHomeViewController: KOBaseViewController {

    private lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    override func loadData() {
        // 模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            for i in 0..<15 {
                if self.isPullup {
                    self.statusList.append("上拉" + i.description)
                } else {
                    self.statusList.insert(i.description, at: 0)
                }
            }
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            self.tableView?.reloadData()
        }
    }
    
    @objc func showFriends() {
        
    }
}


// MARK: - UITableView 相关代理和数据源方法
extension KOHomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = statusList[indexPath.row]
        return cell!
    }
}

extension KOHomeViewController {
    
    override func setupTableView() {
        super .setupTableView()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
    }
}






