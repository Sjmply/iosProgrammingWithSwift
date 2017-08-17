//
//  MainViewController.swift
//  AlertControllerExample
//
//  Created by Nguyen Duc Hoang on 8/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var btnShowAlert:UIButton?
    var alertController: UIAlertController?
    
    @IBAction func btnShowAlert(sender: UIButton) {
        /*
        alertController = UIAlertController(title: "Alert", message: "Are you sure ?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("Press cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("Press OK")
        }
        alertController?.addAction(cancelAction)
        alertController?.addAction(okAction)
        self.present(alertController!, animated: true) {
            print("presented")
        }
 */
        alertController = UIAlertController(title: "Take image", message: "Choose image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            print("You choose Camera")
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) { (action) in
            print("You choose Photo")
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.magenta
        self.present(alertController!, animated: true) {
            print("presented")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
