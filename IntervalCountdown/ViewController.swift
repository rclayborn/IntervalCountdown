//
//  ViewController.swift
//  IntervalCountdown
//
//  Created by Randall Clayborn on 9/13/16.
//  Copyright © 2016 claybear39. All rights reserved.
//

import UIKit


class ViewController: UIViewController, CountdownTimerDelegate {
    
    @IBOutlet weak var timeLabel: UILabel!
    var timer: CountdownTimer!
    
    @IBOutlet weak var TypeSeg: UISegmentedControl!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var SetLabel: UILabel!
    
    var isRunning = true
    var intervalMin = 1
    var intervalSec = 40
    var restMin = 1
    var restSec = 0
    
    var set = 1
    var repeatSet = 2
    
    var typeOFIntervalLabel = ""
    
    @IBOutlet weak var typeOfIntervalLabel: UILabel!
    
    override func viewDidLoad() {
        
       typeOfIntervalLabel.text = "Endurance"
        isRunning = true
        SetLabel.text = "Set: \(set)"
       
    }
    
    func setTime() {
        print("setTime")
        isRunning = true
        // Timer will start at 00:40
        timer = CountdownTimer(timerLabel: timeLabel, startingMin: intervalMin, startingSec: intervalSec)
        timer.delegate = self
        timer.start()
    }
    
    func restTime() {
        print("restTime")
        isRunning = false
        timer = CountdownTimer(timerLabel: timeLabel, startingMin: restMin, startingSec: restSec)
        timer.delegate = self
        timer.start()
    }
    
    func countdownEnded() -> Void {
        // Handle countdown finishing
        print("Count Down Ended")
            timer.reset()
        if isRunning == true {
            restTime()
            set += set
            SetLabel.text = "Set: \(set)"
    } else {
            setTime()
        }
        
        if set == repeatSet {
            finishInterval()
        }
    }
    
    func finishInterval() {
        restLabel.text = "Finished!"
         timer.reset()
    }
    
    @IBAction func startButtonPressed(_ sender: AnyObject) {
       // timer.start() //Begins countdown
         restLabel.text = "GO, GO, GO!"
         setTime()
        //make button disappear. then reapear when finiahed.
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
    
        timer.pause() //Pauses countdown and resets to the initial time
    }
 
    @IBAction func resetButtonPressed(_ sender: AnyObject) {
        timer.reset() //Pauses countdown and resets to the initial time
    }
    
    @IBAction func typeSegAction(_ sender: AnyObject) {
        
        if(TypeSeg.selectedSegmentIndex == 0)
        {
            typeOfIntervalLabel.text = "Endurance"
            
            print("Endurance")
//            intervalMin = 0
//            inatervalSec = 40
//            
//            restMin = 0
//            restSec = 20

//            let setsMin = 10
//            let setsSec = 0
            
//            let setRestMin = 3
//            let setRestSec = 0
            
//            let repeatSet = 10
           
        }
        else if(TypeSeg.selectedSegmentIndex == 1)
        {
           typeOfIntervalLabel.text = "Pedal, Work on your Stoke"
            print("Pedal")
//            intervalMin = 0
//            inatervalSec = 10
//            
//            restMin = 0
//            restSec = 20
            
//            let setMin = 10
//            let setSec = 0
//          
//            let setRestMin = 5
//            let setRestSec = 0
            
//            let repeatSet = 2
            
        }
        else if(TypeSeg.selectedSegmentIndex == 2)
        {
            typeOfIntervalLabel.text = "Climbing"
            print("Climb")
//            let intervalMin = 0
//            let intervalSec = 30
            
//            let restMin = 0
//            let restSec = 20
            
//            let setMin = 10
//            let setSec = 0
//
//            let setRestMin = 5
//            let setRestSec = 0
            
//            let repeatSet = 3
            
        }
        else if(TypeSeg.selectedSegmentIndex == 3)
        {
            print("Power")
            typeOfIntervalLabel.text = "Power"
//            let intervalMin = 0
//            let intervalSec = 20
            
//            let restMin = 0
//            let restSec = 10
            
//            let setMin = 6
//            let setSec = 0
//
//            let setRestMin = 0
//            let setRestSec = 0
            
//            let repeatSet = 6
            
        }
        else if(TypeSeg.selectedSegmentIndex == 4)
        {
            typeOfIntervalLabel.text = "Theshold"
            print("Theshold")
//            let intervalMin = 3
//            let intervalSec = 0
            
//            let restMin = 2
//            let restSec = 0
            
//            let setMin = 15
//            let setSec = 0
//
//            let setRestMin = 0
//            let setRestSec = 0
            
//            let repeatSet = 3
        }
    }

    
}

