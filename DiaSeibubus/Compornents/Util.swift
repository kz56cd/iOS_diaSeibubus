//
//  Util.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/28.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import Foundation

struct SeparatedDate {
    let yearAndMonthAndDay: String
    let hour: String
    let minute: String
}

class Util {
    var separatedDate: SeparatedDate {
        let date = Date()
        return SeparatedDate(
            yearAndMonthAndDay: DateFormatter(format: .yearMonthDay).string(from: date),
            hour: DateFormatter(format: .hour).string(from: date),
            minute: DateFormatter(format: .minute).string(from: date)
        )
    }

    func urlEncode(by string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
}
