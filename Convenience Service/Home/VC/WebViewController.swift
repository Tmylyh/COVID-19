//
//  WebViewController.swift
//  Convenience Service
//
//  Created by mac on 2022/9/18.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var url:URL?
    
    let WebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(WebView)
        
        WebView.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        WebView.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
