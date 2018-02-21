//
//  Foundation+Extension.swift
//  KOWeiBo
//
//  Created by Korune on 2018/2/21.
//  Copyright © 2018年 Korune. All rights reserved.
//

import Foundation

extension Bundle {
    // 计算型属性类似于函数，没有参数，有返回值
    var ko_namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
