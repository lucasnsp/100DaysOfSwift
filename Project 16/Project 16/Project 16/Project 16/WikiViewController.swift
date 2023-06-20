//
//  WikiViewController.swift
//  Project 16
//
//  Created by Lucas Neves dos santos pompeu on 20/06/23.
//

import WebKit
import UIKit

class WikiViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var webView: WKWebView!
    
    var capital: Capital!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: capital.wikiURL))
        webView.allowsBackForwardNavigationGestures = true
    }
}
