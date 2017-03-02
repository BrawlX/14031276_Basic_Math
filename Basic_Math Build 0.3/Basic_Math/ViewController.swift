//
//  ViewController.swift
//  Basic_Math
//
//  Created by jf13abl on 16/02/2017.
//  Copyright © 2017 jf13abl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var answer = 0
    var rng1 = Int(arc4random_uniform(5))
    var rng2 = Int(arc4random_uniform(5))
    var sum = 0
    
    @IBOutlet weak var math: UILabel!
    
    
    
    @IBOutlet weak var congratsView: UIView!
    
    
    
    @IBAction func ans(sender: AnyObject) {
        answer = sender.tag
        if answer == sum{
            math.text = "Correct"
        }
        else{
            math.text = "Wrong"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rng1 = Int(arc4random_uniform(5))
        rng2 = Int(arc4random_uniform(5))
        sum = rng1 + rng2
        math.text = String(rng1) + " + " + String(rng2) + " = ?"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

