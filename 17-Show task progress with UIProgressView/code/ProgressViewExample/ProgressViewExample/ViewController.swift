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
    var myTimer: Timer?
    
    let maxTime = 3.0 //3 seconds
    var currentTime = 0.0
    let timerInterval = 0.03
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView?.setProgress(0.0, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateUI(sender: Timer) {
        if (currentTime < maxTime) {
            currentTime = currentTime + timerInterval
            progressView?.setProgress(Float(currentTime / maxTime), animated: true)
            labelProgress?.text = "\(Int(currentTime * 100 / maxTime)) %"
        } else {
            currentTime = 0.0
            myTimer?.invalidate()
        }
    }
    @IBAction func btnStart(sender: UIButton) {
        guard myTimer == nil else { return }
        myTimer?.invalidate()
        Timer.scheduledTimer(timeInterval: timerInterval,target: self,
                             selector: #selector(updateUI(sender:)),
                             userInfo: nil,
                             repeats: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

