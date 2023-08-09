//
//  separateBrowserController.swift
//  WebViewApp
//
//  Created by Калякин Дима  on 09.08.2023.
//

import Foundation
import WebKit


class MyBrowser: UIViewController {

    let browserView = WKWebView()

    let toolbar = UIToolbar()

    let backButton = UIBarButtonItem(systemItem: .rewind)
    let forwardButton = UIBarButtonItem(systemItem: .fastForward)
    let spacer = UIBarButtonItem(systemItem: .flexibleSpace) // поиграться fixed/flexible  Space
    let reload = UIBarButtonItem(systemItem: .refresh)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.addSubview(browserView)
        browserView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        toolbar.items = [backButton,forwardButton,spacer,reload]
        
        NSLayoutConstraint.activate([
            browserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            browserView.topAnchor.constraint(equalTo: view.topAnchor),
            browserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.topAnchor.constraint(equalTo: browserView.bottomAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -19)
        ])

        backButton.action = #selector(backAction)
        forwardButton.action = #selector(forwardAction)
        reload.action = #selector(reloadAction)
        

        loadBrowser()
    }
    
    @objc func backAction(){
        guard  browserView.canGoBack else {return}
        browserView.goBack()
    }
    
    @objc func forwardAction(){
        browserView.reload()
    }
    
    @objc func reloadAction(){
        guard browserView.canGoForward else {return}
        browserView.goForward()
    }

    private func loadBrowser() {
        guard let googleUrl = URL(string: "https://www.google.com/") else { return  }
        let urlRequest = URLRequest(url: googleUrl)
        browserView.load(urlRequest)
    }
}


