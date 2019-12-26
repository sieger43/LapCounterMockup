//
//  ViewController.swift
//  LapCounterAlpha
//
//  Created by John Berndt on 11/23/19.
//  Copyright © 2019 John Berndt. All rights reserved.
//
import UIKit

class TimerViewController: UIViewController {
    
    var timer: Timer?
    var creationDate = Date()
    
    @IBAction func buttonAction(_ sender: Any) {
        
        if buttonLabel.titleLabel?.text == "Start" {
            creationDate = Date()
            createTimer()
            buttonLabel.setTitle("Stop",for: .normal)
        } else if buttonLabel.titleLabel?.text == "Stop" {
            cancelTimer()
            buttonLabel.setTitle("Start",for: .normal)
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension TimerViewController {
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        
        let time = Date().timeIntervalSince(creationDate)
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        var times: [String] = []
        if hours > 0 {
            times.append("\(hours)h")
        }
        if minutes > 0 {
            times.append("\(minutes)m")
        }
        times.append("\(seconds)s")
        
        timerLabel.text = times.joined(separator: " ")
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
}
