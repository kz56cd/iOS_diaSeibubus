//
//  ResearchView.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/29.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import UIKit
import Prelude

class ResearchView: UIView, XibInstantiatable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiate()
    }
}
