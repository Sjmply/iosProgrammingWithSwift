//
//  NewFoodViewController.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/28/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtFoodName: UITextField?
    @IBOutlet weak var imageViewFood: UIImageView?
    @IBOutlet weak var lblRating: UILabel?
    
    @IBAction func btnSave(sender: UIButton) {
        print("press Save !")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK -- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        return true
    }
}
