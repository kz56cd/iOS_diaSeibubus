//
//  DateFormatter+Formats.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/28.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import Foundation

extension DateFormatter {

    enum DateFormat: String {
//        case yearMonthDayHourMinuteInJapanese = "yyyy年MM月dd日 HH:mm"
//        case yearMonthDayInJapanese = "yyyy年MM月dd日"
//        case yearMonthDateWithSlash = "yyyy/MM/dd"
//        case yearMonthDateWithHyphen = "yyyy-MM-dd HH:mm"
//        case monthDayHourMinuteInJapanese = "MM月dd日 HH:mm"
        case yearMonthDay = "yyyyMMdd"
        case hour = "HH"
        case minute = "mm"
        case second = "ss"
    }

    convenience init(format: DateFormat) {
        self.init()
        self.locale = Locale(identifier: "en_US_POSIX")
        //        self.timeZone = TimeZone(secondsFromGMT: forSecondsFromGMT)
        self.dateFormat = format.rawValue
    }
}
