//
//  BusstopInfo.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/27.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import Foundation

struct BusstopInfo: Codable {
    let identifier: String
    let name: String
    let isStationBusTarminal: Bool
}
