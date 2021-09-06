//
//  WebViewController.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 01/09/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var newsURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURLToWebView()
    }
    
    private func loadURLToWebView() {
        guard let urlRequest = URL(string: newsURL) else {
            debugPrint(CustomErrors.invalidURL.rawValue)
            return
        }
        webView.load(URLRequest(url: urlRequest))
    }

}
