//
//  ViewController.swift
//  ProgressViewExample
//
//  Created by Nguyen Duc Hoang on 8/20/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView:UIProgressView?
    @IBOutlet weak var labelProgress: UILabel?
    
    let maxTime = 3.0 //3 seconds
    var currentTime = 0.0
    let timerInterval = 0.03 //refresh after 0.03 second
    var myTimer: Timer?
    
    @IBAction func btnStart(sender: UIButton) {
        guard myTimer == nil else { return }
        myTimer?.invalidate()
        myTimer = Timer.scheduledTimer(timeInterval: timerInterval,target: self,
                                       selector: #selector(updateUI(sender:)),
                                       userInfo: nil,
                                       repeats: true)
    }
    @objc func updateUI(sender: Timer) {
        if (currentTime < maxTime) {
            currentTime = currentTime + timerInterval
            progressView?.progress = Float(currentTime / maxTime)
            labelProgress?.text = "\(Int(currentTime * 100 / maxTime)) %"
        } else {
            //When it is 100 %
            currentTime = 0.0
            myTimer?.invalidate()
            myTimer = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressView?.setProgress(0.0, animated: true)
        labelProgress?.text = ""
    }

}

