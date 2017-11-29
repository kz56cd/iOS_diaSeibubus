//
//  ResearchView.swift
//  DiaSeibubus
//
//  Created by msano on 2017/11/29.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import Prelude

@objc protocol ResearchViewDelegate {
    func tappedResearch(with minute: Int)
}

class ResearchView: UIView, XibInstantiatable {

    @IBOutlet weak var minuteCountLabel: UILabel!

    weak var delegate: ResearchViewDelegate?
    private var minuteCount: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiate()
    }

    // MARK: action

    @IBAction func researchButtonTapped(_ sender: UIButton) {
        delegate?.tappedResearch(with: minuteCount)
    }

    @IBAction func plusButtonTapped(_ sender: UIButton) {
        minuteCount += 5
        minuteCountLabel.text = "\(minuteCount)"
    }

    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if minuteCount >= 5 {
            minuteCount -= 5
            minuteCountLabel.text = "\(minuteCount)"
        }
    }
}
