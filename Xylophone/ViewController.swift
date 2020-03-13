//
//  ViewController.swift
//  Xylophone
//
//  Created by Huseyin Can Dayan on 27.01.2020.
//  Copyright © 2020 hcd. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func keyPressed(_ sender: UIButton) {
//        print("start")
            sender.alpha = 1
            let note = sender.currentTitle!
//            print(note)
                func opacityChange(changeRatio: Double) {
                    sender.alpha = (CGFloat)(Double(sender.alpha) * changeRatio)
            }
           opacityChange(changeRatio: 0.5)
//        print("end")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `2.0` to the desired number of seconds.
                playSound(soundName: note)
                opacityChange(changeRatio: 2)
        }
        func playSound(soundName: String) {
               let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
               player = try! AVAudioPlayer(contentsOf: url!)
               player.play()
           }
        }
    }

