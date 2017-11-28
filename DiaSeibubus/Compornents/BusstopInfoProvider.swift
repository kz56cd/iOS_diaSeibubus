//
//  BusstopInfoProvider.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/28.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import Foundation

class BusstopInfoProvider {

    var infos: [BusstopInfo]?

    init() {
        infos = prepareBusstopInfo()
    }

    func configureRequestUrlString(
        with startInfo: BusstopInfo?,
        endInfo: BusstopInfo?
        ) -> String? {

        guard let startBusstopInfo = startInfo,
            let endBusstopInfo = endInfo else {
                return nil
        }
        let separatedDate = Util().separatedDate

        var str = "http://transfer.navitime.biz/seibubus-dia/smart/transfer/TransferSearch"
        str += "?minute=\(separatedDate.minute)"
        str += "&startName=\(Util().urlEncode(by: startBusstopInfo.name) ?? "")"
        str += "&sort=2"
        str += "&wspeed=standard"
        str += "&basis=1"
        str += "&start=\(startBusstopInfo.identifier)"
        str += "&method=2"
        str += "&hour=\(separatedDate.hour)"
        str += "&day=20171127"
        str += "&goalName=\(Util().urlEncode(by: endBusstopInfo.name) ?? "")"
        str += "&goal=\(endBusstopInfo.identifier)"
        return str
    }

    // MARK: private

    private func prepareBusstopInfo() -> [BusstopInfo]? {
        guard let jsonPath = Bundle.main.path(forResource: "busstops", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                return nil
        }
        return try? JSONDecoder().decode([BusstopInfo].self, from: data)
    }
}
