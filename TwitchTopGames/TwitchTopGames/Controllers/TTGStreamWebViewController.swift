//
//  TTGStreamWebViewController.swift
//  TwitchTopGames
//
//  Created by João Carreira on 29/03/2017.
//  Copyright © 2017 João Carreira. All rights reserved.
//

import UIKit

class TTGStreamWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    var url: URL?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: url!))
    }
}
