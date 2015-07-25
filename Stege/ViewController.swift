//
//  ViewController.swift
//  Stege
//
//  Created by Hamon Riazy on 25/07/15.
//  Copyright (c) 2015 ryce. All rights reserved.
//

import UIKit
import AVFoundation
import EasyAnimation

class ViewController: UIViewController {
    
    @IBOutlet var stegeImage: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stegeImage.clipsToBounds = true
        self.stegeImage.layer.cornerRadius = 50.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        // play random audio
        let number = Int(rand()) % 5
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(String(number), ofType: "m4a")!)
        self.audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        self.audioPlayer.play()
        
        // wiggle image
        UIView.animateAndChainWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.stegeImage.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }, completion: nil).animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.33, initialSpringVelocity: 0.0, options: nil, animations: {
                self.stegeImage.transform = CGAffineTransformMakeScale(1, 1)
                }, completion: nil)
    }


}

