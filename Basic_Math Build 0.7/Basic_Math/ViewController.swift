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
    
    @IBOutlet weak var correct: UILabel!
    
    @IBOutlet weak var stars: UIView!
    
    
    @IBOutlet weak var correct2: UILabel!
    
    @IBOutlet weak var cloud: UIImageView!
    
    @IBOutlet weak var smiley_cloud: UIImageView!
    
    @IBOutlet weak var snore_cloud: UIImageView!
    
    
    
    @IBAction func ans(sender: AnyObject) {
        answer = sender.tag
        if answer == sum{
            congratsView.hidden = false
            correct.text = String(rng1) + " + " + String(rng2) + " = "
            correct2.text = String(sum)
            UIView.animateWithDuration(0.5, delay: 0, options: [.Autoreverse, .Repeat], animations: {self.stars.alpha = 0}, completion: nil)
        }
        else{
            UIView.animateWithDuration(1, animations:{ self.wrong.alpha = 1
                self.wrong.alpha = 0
                },completion: nil)
        }
    }
    
    @IBAction func reset(sender: AnyObject) {
        self.viewDidLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrong.alpha = 0
        congratsView.hidden = true
        rng1 = Int(arc4random_uniform(5))
        rng2 = Int(arc4random_uniform(5))
        sum = rng1 + rng2
        math.text = String(rng1) + " + " + String(rng2) + " ="
        UIView.animateWithDuration(30, delay: 0, options: .Repeat, animations: {
            self.cloud.center.x = 550
            }, completion: nil)
        UIView.animateWithDuration(40, delay: 4, options: .Repeat, animations: {
            self.smiley_cloud.center.x = 550
            }, completion: nil)
        UIView.animateWithDuration(30, delay: 12, options: .Repeat, animations: {
            self.snore_cloud.center.x = 550
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

