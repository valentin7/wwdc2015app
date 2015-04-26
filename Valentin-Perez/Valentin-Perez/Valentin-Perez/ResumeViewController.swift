//
//  ResumeViewController.swift
//  ValentinWWDC2015
//
//  Created by Valentin Perez on 4/25/15.
//  Copyright (c) 2015 Valentin Perez. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIWebView.loadRequest(webView)(NSURLRequest(URL: NSURL(string: "http://val.pe/Valentin_Perez_Resume.pdf")!))

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        //UIWebView.loadRequest(webView)(NSURLRequest(URL: NSURL(string: "http://val.pe/Valentin_Perez_Resume.pdf")!))
        //webView.loadRequest(NSURLRequest(URL: NSURL(string: "val.pe/Valentin_Perez_Resume.pdf")!))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
