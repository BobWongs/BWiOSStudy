//
//  BWWebViewVC.swift
//  BWSwiftStudy-iOS
//
//  Created by BobWong on 16/11/17.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import UIKit

class BWWebViewVC: BWBaseVC, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Web View"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        webView.delegate = self
        
        webView.loadRequest(NSURLRequest.init(URL: NSURL.init(string: "wwww.baidu.com")!))
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("webViewDidStartLoad")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("webViewDidFinishLoad")
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWithRequest")
        return true
    }
}
