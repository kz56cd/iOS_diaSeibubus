//
//  Util.swift
//  DiaSeibubus
//
//  Created by msano on 2017/11/28.
//  Copyright © 2017年 msano. All rights reserved.
//

import Foundation

struct SeparatedDate {
    let yearAndMonthAndDay: String
    let hour: String
    let minute: String
}

class Util {
    func getSeparatedDate(with minute: Int) -> SeparatedDate {
        let date = Date(timeInterval: Double(minute * 60), since: Date())
        print(date)
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
