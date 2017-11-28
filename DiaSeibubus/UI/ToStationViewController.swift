//
//  ToStationViewController.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/27.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import UIKit
import WebKit

class ToStationViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var startBusstopInfo: BusstopInfo? {
        guard let parent = parent as? PageViewController,
        let infos = parent.infos else {
            return nil
        }
        return infos.filter { $0.isStationBusTarminal == false }.first
    }
    
    var endBusstopInfo: BusstopInfo? {
        guard let parent = parent as? PageViewController,
            let infos = parent.infos else {
                return nil
        }
        return infos.filter { $0.isStationBusTarminal == true }.first
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: private
    
    private func configureWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        loadWebView()
    }
    
    private func loadWebView() {
        
        func configureUrlString() -> String? {
            guard let startBusstopInfo = startBusstopInfo,
                let endBusstopInfo = endBusstopInfo else {
                    return ""
            }
            var str = "http://transfer.navitime.biz/seibubus-dia/smart/transfer/TransferSearch"
            str += "?minute=56"
            str += "&startName=\(Util().urlEncode(by: startBusstopInfo.name) ?? "")"
            str += "&sort=2"
            str += "&wspeed=standard"
            str += "&basis=1"
            str += "&start=\(startBusstopInfo.identifier)"
            str += "&method=2"
            str += "&hour=11"
            str += "&day=20171127"
            str += "&goalName=\(Util().urlEncode(by: endBusstopInfo.name) ?? "")"
            str += "&goal=\(endBusstopInfo.identifier)"
            return str
        }
        
        guard let urlString = configureUrlString(),
            let url = URL(string: urlString) else {
                return
        }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("😎 loaded: ToStation dia.")
    }
}
