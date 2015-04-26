//
//  MoreInfoViewController.swift
//  ValentinWWDC2015
//
//  Created by Valentin Perez on 4/26/15.
//  Copyright (c) 2015 Valentin Perez. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var actionButton: UIButton!
    @IBOutlet var descriptionTextView: UITextView!
    
    var descriptionString : String!
    var buttonTitle : String!
    var actionURL : String!

    
    
    // create instance of our custom transition manager
    let transitionManager = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = self.transitionManager
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("tappedOnScreen"))
        
        tap.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        descriptionTextView.text = descriptionString
        descriptionTextView.textColor = UIColor.lightGrayColor()
        descriptionTextView.font = UIFont(name: "HelveticaNeue-Thin", size: 19)
        actionButton.setTitle(buttonTitle, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedOnScreen() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func tappedButton(sender: AnyObject) {
        if let checkURL = NSURL(string: actionURL) {
            UIApplication.sharedApplication().openURL(NSURL(string: actionURL)!)
        } else {
            println("invalid url")
        }
        
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
