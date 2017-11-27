//
//  FromStationViewController.swift
//  DiaSeibubus
//
//  Created by 佐野正和 on 2017/11/27.
//  Copyright © 2017年 佐野正和. All rights reserved.
//

import UIKit
import WebKit

class FromStationViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
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
        let urlString = "https://qiita.com/"
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("😎")
    }
}
