//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var counter : Int = 0
    let eggTimes : [String : Int] = ["Soft" : 3, "Medium" : 4, "Hard" : 5 ]
    var timer = Timer()
    var total : Int = 0
    var player = AVAudioPlayer()
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBAction func hardnessButtonSelected(_ sender: UIButton) {
        
        timer.invalidate()
//        player.stop()
        //        currentLabel?.text = "How do you like your eggs?"
        //        progressView.progress = 0
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
        total = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        currentLabel?.text = hardness
        //
        
        
    }
    @objc func updateCounter() {
        if counter > 0 {
            counter = counter - 1
            //            print("\(counter) seconds")
            //            print("counter \(counter)")
            //            print("total \(total)")
            let progressDone = Float(Float(counter)/Float(total))
            progressView.progress = 1.0 - Float(progressDone)
        } else {
            currentLabel?.text = "Done"
            progressView.progress = 0
            playSound()
            //            currentLabel?.text = "How do you like your eggs?"
        }
        
        
    }
    func playSound() {
        let path = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        //        let url = URL(fileURLWithPath: path)
        player = try! AVAudioPlayer(contentsOf: path!)
        player.play()
    }
    
    
}
