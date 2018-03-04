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
        for i in 0..<15 {
            statusList.insert(i.description, at: 0)
        }
    }
}

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
