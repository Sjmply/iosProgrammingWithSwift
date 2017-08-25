//
//  MainViewController.swift
//  ScenesAndSeguesExample
//
//  Created by Nguyen Duc Hoang on 8/24/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var txtData: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToMainViewController(unwindSegue: UIStoryboardSegue) {
        //Do not need to do anything
        if unwindSegue.identifier == "Screen1ToMain" {
            let scene1ViewController = unwindSegue.source as! Sceen1ViewController
            print("Data from Sceen1: \(scene1ViewController.txtData?.text ?? "")")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToSceen1" {
            /*
            let scene1ViewController = segue.destination as! Sceen1ViewController
            scene1ViewController.textFromMainVC = txtData?.text ?? ""
             */
            DataPassing.shared.textToPassing = txtData?.text ?? ""
        }
    }

}
