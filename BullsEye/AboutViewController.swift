//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Frank Chen on 2018-11-24.
//  Copyright © 2018 Frank Chen. All rights reserved.
//

import UIKit
import WebKit


class AboutViewController: UIViewController {
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
         
            
            let html = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
            
            self.webView.loadHTMLString(html, baseURL: nil)
        }
    }
    
    @IBAction func close () {
        dismiss(animated: true, completion: nil)
    }


}
