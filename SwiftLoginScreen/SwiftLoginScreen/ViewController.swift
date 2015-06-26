//
//  ViewController.swift
//  SwiftLoginScreen
//
//  Created by Ligia Montejo on 6/26/15.
//  Copyright (c) 2015 MobileAndCloudCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var username: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.performSegueWithIdentifier("goto_login", sender: self)
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            self.username.text = prefs.valueForKey("USERNAME") as! NSString as String
        }
    }

    @IBAction func logoutTapped(sender: UIButton) {
         //self.performSegueWithIdentifier("goto_login", sender: self)
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_login", sender: self)
    }

}

