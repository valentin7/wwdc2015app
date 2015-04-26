//
//  ViewController.swift
//  ValentinWWDC2015
//
//  Created by Valentin Perez on 4/16/15.
//  Copyright (c) 2015 Valentin Perez. All rights reserved.
//

import UIKit


class ViewController: UIViewController, TTSliddingPageDelegate, TTSlidingPagesDataSource {

    var controllerNames = ["Intro", "Projects", "Resume", "Website"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slider : TTScrollSlidingPagesController = TTScrollSlidingPagesController()
        slider.titleScrollerBackgroundColour = UIColor.whiteColor()
        slider.titleScrollerInActiveTextColour = UIColor(white: 0, alpha: 0.95)
        slider.titleScrollerTextColour = UIColor.blackColor()
        slider.dataSource = self
        slider.delegate = self
        slider.disableTitleShadow = true
        slider.view.frame = self.view.frame
        slider.view.backgroundColor = UIColor(white: 1, alpha: 1)

        var string = UIDevice.currentDevice().systemVersion as NSString
        

        if (string.floatValue >= 7) {
            slider.hideStatusBarWhenScrolling = true
        } else {
            UIApplication.sharedApplication().setStatusBarHidden(true , withAnimation: UIStatusBarAnimation.Fade)
        }
        
        
        self.view.addSubview(slider.view)
        self.addChildViewController(slider)
        
    }
   
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfPagesForSlidingPagesViewController(source: TTScrollSlidingPagesController!) -> Int32 {
        return 4
    }
    
    func pageForSlidingPagesViewController(source: TTScrollSlidingPagesController!, atIndex index: Int32) -> TTSlidingPage! {        
        var vcName : String
        
        switch (index) {
            case 0:
                vcName = "introController"
                break
            case 1:
                vcName = "projectsController"
                break
            case 2:
                vcName = "resumeController"
                break
            case 3:
                vcName = "websiteController"
                break
            default:
                vcName = "introController"
                break
        }
        
        println("name is " + vcName)
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier(vcName) as UIViewController

        return TTSlidingPage(contentViewController: vc);
    }


    func titleForSlidingPagesViewController(source: TTScrollSlidingPagesController!, atIndex index: Int32) -> TTSlidingPageTitle! {
    

       var title = TTSlidingPageTitle(headerText: controllerNames[Int(index)])
        
        return title
    }
    
    func didScrollToViewAtIndex(index: UInt) {
        print("scrolled to view at \n", index)
    }

     


    
}

