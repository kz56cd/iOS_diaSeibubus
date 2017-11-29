//
//  BusstopInfoProvider.swift
//  DiaSeibubus
//
//  Created by msano on 2017/11/28.
//  Copyright © 2017年 msano. All rights reserved.
//

import Foundation

class BusstopInfoProvider {

    var infos: [BusstopInfo]?

    init() {
        infos = prepareBusstopInfo()
    }
    
    func configureRequestUrlString(
        with startInfo: BusstopInfo?,
        endInfo: BusstopInfo?,
        addMinute: Int
        ) -> String? {

        guard let startBusstopInfo = startInfo,
            let endBusstopInfo = endInfo else {
                return nil
        }
        let separatedDate = Util().getSeparatedDate(with: addMinute)
        var str = "http://transfer.navitime.biz/seibubus-dia/smart/transfer/TransferSearch"
        str += "?minute=\(separatedDate.minute)"
        str += "&startName=\(Util().urlEncode(by: startBusstopInfo.name) ?? "")"
        str += "&sort=2"
        str += "&wspeed=standard"
        str += "&basis=1"
        str += "&start=\(startBusstopInfo.identifier)"
        str += "&method=2"
        str += "&hour=\(separatedDate.hour)"
        str += "&day=\(separatedDate.yearAndMonthAndDay)"
        str += "&goalName=\(Util().urlEncode(by: endBusstopInfo.name) ?? "")"
        str += "&goal=\(endBusstopInfo.identifier)"
        return str
    }

    // MARK: private

    private func prepareBusstopInfo() -> [BusstopInfo]? {
        guard let jsonPath = Bundle.main.path(forResource: "busstops", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                let error = """
                    [Error] : Could not find bussstop information. Check README
                    https://github.com/kz56cd/iOS_dia_seibubus
                    """
                print(error)
                return nil
        }
        return try? JSONDecoder().decode([BusstopInfo].self, from: data)
    }
}
