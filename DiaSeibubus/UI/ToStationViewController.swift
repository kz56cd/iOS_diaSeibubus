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

    let startBusstopInfo: BusstopInfo? = BusstopInfoProvider()
        .infos?
        .filter { $0.isStationBusTarminal == false }
        .first
    let endBusstopInfo: BusstopInfo? = BusstopInfoProvider()
        .infos?
        .filter { $0.isStationBusTarminal == true }
        .first

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }

    // MARK: private

    private func configureWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        loadWebView()
    }

    private func loadWebView() {
        guard let urlString = BusstopInfoProvider().configureRequestUrlString(
            with: startBusstopInfo,
            endInfo: endBusstopInfo
            ),
            let url = URL(string: urlString) else {
                return
        }

        webView.load(URLRequest(url: url))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("😎 loaded: ToStation dia.")
    }
}
