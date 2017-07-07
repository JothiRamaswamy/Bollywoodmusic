//
//  ViewController.swift
//  Audio Player
//
//  Created by Sambandam, Sujatha {BIS} on 7/2/17.
//  Copyright © 2017 Jothi R. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "Edited_final_mix", ofType: "mp3")
    
    var timer = Timer()
    
    func updateScrubber(){
        
        scrubber.value = Float(player.currentTime)
        
    }
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }

    @IBAction func volumeChanged(_ sender: UISlider) {
        
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func scrubberMoved(_ sender: UISlider) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    @IBOutlet weak var scrubber: UISlider!
    
    @IBAction func stop(_ sender: Any) {
        
        scrubber.value = 0
        
        timer.invalidate()
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
            //process error
            
        }
        
    }
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
        timer.invalidate()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
            //process error
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

