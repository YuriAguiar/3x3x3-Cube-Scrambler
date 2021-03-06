//
//  SecondViewController.swift
//  Cubix
//
//  Created by Yuri Aguiar on 29/01/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {

    var pdfLoc = NSURL(fileURLWithPath: Bundle.main.path(forResource: "2LookOLL", ofType: "pdf")!)
    
    @IBOutlet weak var pdfView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSURLRequest(url: pdfLoc as URL)
        self.pdfView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

