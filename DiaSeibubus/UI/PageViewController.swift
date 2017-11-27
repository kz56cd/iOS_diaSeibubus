//
//  PageViewController.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/27.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var fromStationVC: FromStationViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FromStationViewController") as! FromStationViewController
    }
    var toStationVC: ToStationViewController {
        return storyboard!.instantiateViewController(withIdentifier: "ToStationViewController") as! ToStationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBusstopInfo()
        
        setViewControllers(
            [fromStationVC],
            direction: .forward,
            animated: true,
            completion: nil
        )
        dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController {
    private func configureBusstopInfo() {
        guard let jsonPath = Bundle.main.path(forResource: "busstops", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
            return
        }
        let busstops = try? JSONDecoder().decode([BusstopInfo].self, from: data)
        print(busstops)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FromStationViewController.classForCoder()) {
            return toStationVC
        } else if viewController.isKind(of: ToStationViewController.classForCoder()) {
            return nil
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FromStationViewController.classForCoder()) {
            return toStationVC
        } else if viewController.isKind(of: ToStationViewController.classForCoder()) {
            return nil
        }
        return nil
    }
}
