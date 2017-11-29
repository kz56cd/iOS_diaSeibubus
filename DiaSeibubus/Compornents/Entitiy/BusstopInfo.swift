//
//  BusstopInfo.swift
//  DiaSeibubus
//
//  Created by msano on 2017/11/27.
//  Copyright © 2017年 msano. All rights reserved.
//

import Foundation

struct BusstopInfo: Codable {
    let identifier: String
    let name: String
    let isStationBusTarminal: Bool
}
