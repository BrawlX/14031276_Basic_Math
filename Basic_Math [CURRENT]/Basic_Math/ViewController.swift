//
//  ViewController.swift
//  Basic_Math
//
//  Created by jf13abl on 16/02/2017.
//  Copyright © 2017 jf13abl. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Fields
    
    var answer = 0
    var rng1 = Int(arc4random_uniform(5))
    var rng2 = Int(arc4random_uniform(5))
    var sum = 0
    var audioPlayer: AVAudioPlayer?
    var wroong: AVAudioPlayer?
    var yay: AVAudioPlayer?
    var check = 0
    let url = NSBundle.mainBundle().URLForResource("City_Of_Happy_Ones", withExtension: "mp3")!
    let url2 = NSBundle.mainBundle().URLForResource("yay", withExtension: "mp3")!
    let url3 = NSBundle.mainBundle().URLForResource("Wrooong", withExtension: "mp3")!
    
    //Objects
    
    @IBOutlet weak var math: UILabel!
    
    @IBOutlet weak var congratsView: UIView!
    
    @IBOutlet weak var correct: UILabel!
    
    @IBOutlet weak var stars: UIView!
    
    @IBOutlet weak var wrong: UIImageView!
    
    @IBOutlet weak var correct2: UILabel!
    
    @IBOutlet weak var smiley_cloud: UIImageView!
    
    
    //Answer Check
    
    @IBAction func ans(sender: AnyObject) {
        answer = sender.tag
        if answer == sum{
            congratsView.hidden = false
            correct.text = String(rng1) + " + " + String(rng2) + " = "
            correct2.text = String(sum)
            UIView.animateWithDuration(0.5, delay: 0, options: [.Autoreverse, .Repeat], animations: {self.stars.alpha = 0}, completion: nil)
            do {
                yay = try AVAudioPlayer(contentsOfURL:url2)
                guard let yay = yay else { return }
                
                yay.prepareToPlay()
                yay.play()
            }
            catch let error as NSError{
                print (error.localizedDescription)
            }
        }
        else{
            UIView.animateWithDuration(1, animations:{ self.wrong.alpha = 1
                self.wrong.alpha = 0
                },completion: nil)
            do {
                wroong = try AVAudioPlayer(contentsOfURL:url3)
                guard let wroong = wroong else { return }
                
                wroong.prepareToPlay()
                wroong.play()
            }
            catch let error as NSError{
                print (error.localizedDescription)
            }
        }
    }
    
    @IBAction func reset(sender: AnyObject) {
        self.viewDidLoad()
    }
    
    
    //Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrong.alpha = 0
        congratsView.hidden = true
        rng1 = Int(arc4random_uniform(5))
        rng2 = Int(arc4random_uniform(5))
        sum = rng1 + rng2
        math.text = String(rng1) + " + " + String(rng2) + " ="
        UIView.animateWithDuration(40, delay: 4, options: .Repeat, animations: {
            self.smiley_cloud.center.x = 600
            }, completion: nil)
        if (check == 0){
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL:url)
                guard let audioPlayer = audioPlayer else { return }
            
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                audioPlayer.numberOfLoops = -1
            }
            catch let error as NSError{
                print (error.localizedDescription)
            }
        }
        check = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

