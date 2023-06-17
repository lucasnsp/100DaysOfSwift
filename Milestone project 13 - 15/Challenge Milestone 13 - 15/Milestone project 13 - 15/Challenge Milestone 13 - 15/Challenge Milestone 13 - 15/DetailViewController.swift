//
//  DetailViewController.swift
//  Challenge Milestone 13 - 15
//
//  Created by Lucas Neves dos santos pompeu on 16/06/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var selectedCountry:Country!
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        let html = """
               <html>
               <head>
               <meta name="viewport" content="width=device-width, initial-scale=1">
               <style> body { font-size: 120%; font-family: -apple-system} </style>
               </head>
               <body>
               <h3>\(selectedCountry.name.official)</h3>
               <hr>
               <p>Region: \(selectedCountry.region.rawValue)</p>
               <p>Capital City: \(selectedCountry.capital?.first ?? "Unknown")</p>
               <p>Flag: \(selectedCountry.flag) </p>
               <p>Total Population: \(selectedCountry.population) </p>
               <p>Driving side: \(selectedCountry.car.side.rawValue)</p>
               </body>
               </html>
               """
        print(selectedCountry.flag)
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    @objc func shareTapped(){
        let fact = "Did you know that \(selectedCountry.name.official) has a population of \(selectedCountry.population) and they drive on the \(selectedCountry.car.side.rawValue) side!"
        
        let vc = UIActivityViewController(activityItems: [fact], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    
}
