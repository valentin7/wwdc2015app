//
//  ProjectsViewController.swift
//  ValentinWWDC2015
//
//  Created by Valentin Perez on 4/25/15.
//  Copyright (c) 2015 Valentin Perez. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var projectNames: [String] = ["Join", "Gravity Monkey", "endLine", "NMH Mobile App", "Ask Guru", "We Wash it Laundry", "Tensor", "Evil Hangman", "Magnet", "Connect"]
    
    var descriptions: [String] = ["Won 2nd Place and Most Creative at MIT's Startup Pitch Competition 2014", "Ranked #1 on both new Adventure and Arcade games on U.S. store.", "Best Pitch award at MIT's Launch program", "Northfield Mount Hermon's school official app.", "Ask anything and guru will answer.", "App for laundry business in Pennsylvania.", "Data analysis of movements with Myo armband. YHack 2014", "Hangman with an evil twist.", "Find studdy buddies. HackMIT 2014", "Connect with people near you. Hack@Brown 2014"]
    
    
    var moreDescriptions: [String] = ["Beautiful animations. All your networks in one place. Parse backend.", "In-app purchases. Game Center. Cocos2D game engine. Multiple monkeys and power-ups.", "Pre-order and pre-pay coffee from your phone. Skip the lines.", "Includes social updates from Twitter, Facebook, and Instagram, photos from Flickr, weekly dining menu, campus map, and much more. ", "Entertainment app to amaze people around you.", "Pick up requests for laundry company catering to UPenn and 5 other colleges.", "Record your movements with the Myo, visualize a graph in your phone and receive feedback on your movements.", "Uses algorithm with Equivalence classes and Set theory that switches words depending on user's input. Much harder than normal.", "See your classes and notify friends you will be studying for that exam.", "Displays a list of users on the same Wi-Fi network, complete with a picture and a list of interests for each user."]
    
    var buttonTitles: [String] = ["Open in AppStore", "Open in AppStore", "Open website", "Open in AppStore", "Open in AppStore", "Open in AppStore", "Open in Challengepost", "Open in AppStore", "Open in Challengepost", "Open in Github"]
    
    var actionURLs: [String] = ["https://itunes.apple.com/us/app/join-profile/id911229181?ls=1&mt=8", "https://itunes.apple.com/us/app/gravity-monkey/id834718968?mt=8", "http://endline.io", "https://itunes.apple.com/us/app/nmh-mobile/id869141239?mt=8", "https://itunes.apple.com/us/app/ask-guru/id779703204?mt=8", "https://itunes.apple.com/us/app/we-wash-it/id793048373?mt=8", "http://challengepost.com/software/tensor-o7nfo", "https://itunes.apple.com/us/app/evil-hangman/id754746889?mt=8", "https://itunes.apple.com/us/app/ask-guru/id779703204?mt=8", "https://github.com/valentin7/Connect"]

    
    var imageNames: [String] = ["join.png", "gm.png", "endline.png", "NMH.png", "guru.png", "laundry.png", "tensor-disp.png", "evil.jpg", "magnet.png", "connect.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : ProjectTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("projectCell") as! ProjectTableViewCell
        //cell.imageView?.image = UIImage(named: self.imageNames[indexPath.row])

        cell.nameLabel?.text = self.projectNames[indexPath.row]
        cell.descriptionLabel?.text = self.descriptions[indexPath.row]
        cell.projectImageView?.image = UIImage(named: self.imageNames[indexPath.row])
        cell.clipsToBounds = true

        
        return cell
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        // bug? exit segue doesn't dismiss so we do it manually...
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
//        return 2
//    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 158
    }
   
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc : MoreInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("moreInfoController") as! MoreInfoViewController
        vc.descriptionString = moreDescriptions[indexPath.row]
        vc.buttonTitle = buttonTitles[indexPath.row]
        vc.actionURL = actionURLs[indexPath.row]
        
        self.presentViewController(vc, animated: true, completion: nil)
        
        
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    
    //This function is where all the table cell animations magic happens
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var rotation : CATransform3D
        
        rotation = CATransform3DMakeRotation((90.0*3.14159)/180, 0.0, 0.7, 0.4)
        
        rotation.m34 = 1.0/(-600)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(10, 10)
        cell.alpha = 0
        
        cell.layer.transform = rotation
        cell.layer.anchorPoint = CGPointMake(0.5, 0.5)
        
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.3)
        
        cell.layer.transform = CATransform3DIdentity
        cell.alpha = 1
        cell.layer.shadowOffset = CGSizeMake(0, 0)
        UIView.commitAnimations()
        
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
