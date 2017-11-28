//
//  PageViewController.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/27.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import UIKit
import SVProgressHUD

class PageViewController: UIPageViewController {

    var fromStationVC: FromStationViewController? {
        return storyboard?.instantiateViewController(withIdentifier: "FromStationViewController")
            as? FromStationViewController
    }
    var toStationVC: ToStationViewController? {
        return storyboard?.instantiateViewController(withIdentifier: "ToStationViewController")
            as? ToStationViewController
    }

    var infos: [BusstopInfo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        infos = BusstopInfoProvider().infos
        dataSource = self
        configureHUD()
        configureChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController {
    private func configureHUD() {
        SVProgressHUD.setMinimumDismissTimeInterval(0.5)
        SVProgressHUD.setBackgroundColor(UIColor.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
    }
    private func configureChildViewControllers() {
        guard let fromStationVC = fromStationVC else {
            return
        }
        setViewControllers(
            [fromStationVC],
            direction: .forward,
            animated: true,
            completion: nil
        )
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
        if viewController.isKind(of: FromStationViewController.classForCoder()) {
            return toStationVC ?? nil
        } else if viewController.isKind(of: ToStationViewController.classForCoder()) {
            return nil
        }
        return nil
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        if viewController.isKind(of: FromStationViewController.classForCoder()) {
            return nil
        } else if viewController.isKind(of: ToStationViewController.classForCoder()) {
            return fromStationVC ?? nil
        }
        return nil
    }
}
