//
//  ViewController.swift
//  Tutorial-JSON-Alamofire
//
//  Created by Ligia Montejo on 6/23/15.
//  Copyright (c) 2015 MobileAndCloudCo. All rights reserved.
//

import UIKit
//import Alamofire
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var fecha: UILabel!
    
    @IBOutlet weak var ipAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getFecha()
        getIP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFecha()
    {
        Alamofire.request(.GET, "http://date.jsontest.com").responseJSON() {
            (_, _, JSON, error) in
            if error == nil {
                let info =  JSON as! NSDictionary
                self.fecha.text = info["date"] as? String
                println(JSON)
            } else {
                println(error)
            }
        }
    }
    
    func getIP(){
        Alamofire.request(.GET, "http://ip.jsontest.com").responseJSON() {
            (_, _, JSON, error) in
            if error == nil {
                let info =  JSON as! NSDictionary
                self.ipAddress.text = info["ip"] as? String
                println(JSON)
            } else {
                println(error)
            }
        }

    }


}

