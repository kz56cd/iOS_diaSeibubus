//
//  Util.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/28.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import Foundation

class Util {
    func urlEncode(by string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
}
