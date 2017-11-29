//
//  FromStationViewController.swift
//  DiaSeibubus
//
//  Created by msano on 2017/11/27.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class FromStationViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var researchView: ResearchView!

    let startBusstopInfo: BusstopInfo? = BusstopInfoProvider()
        .infos?
        .filter { $0.isStationBusTarminal == true }
        .first
    let endBusstopInfo: BusstopInfo? = BusstopInfoProvider()
        .infos?
        .filter { $0.isStationBusTarminal == false }
        .first

    override func viewDidLoad() {
        super.viewDidLoad()
        researchView.delegate = self
        configureWebView()
    }

    // MARK: private

    private func configureWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        loadWebView(with: 0)
    }

//    private func loadWebView() {
    private func loadWebView(with minute: Int) {
        guard let urlString = BusstopInfoProvider().configureRequestUrlString(
            with: startBusstopInfo,
            endInfo: endBusstopInfo,
            addMinute: minute
            ),
            let url = URL(string: urlString) else {
            return
        }
        SVProgressHUD.show()
        webView.load(URLRequest(url: url))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
        SVProgressHUD.showSuccess(withStatus: "loaded.")
    }
}

extension FromStationViewController: ResearchViewDelegate {
    func tappedResearch(with minute: Int) {
        loadWebView(with: minute)
    }
}
