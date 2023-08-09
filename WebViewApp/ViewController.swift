//
//  ViewController.swift
//  WebViewApp
//
//  Created by Калякин Дима  on 09.08.2023.
//

import UIKit
import WebKit



 
class ViewController: UIViewController {

    private let webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        loadRequest()
//        loadPDF()
//        loadHtml()
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.google.com/") else {return}
        
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    }
    
    private func loadPDF() {
        guard let urlPDF = Bundle.main.url(forResource: "sample", withExtension: "pdf") else {return}
        
        let urlRequestPdf = URLRequest(url: urlPDF)
        
        webView.load(urlRequestPdf)
        
        print("Complite!!!")
    }
    
    private func loadHtml() {
        webView.loadHTMLString(Source.htmlString, baseURL: nil)
    }

}

