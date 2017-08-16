//
//  MainViewController.swift
//  TextFieldExample
//
//  Created by Nguyen Duc Hoang on 8/16/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtFoodName: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillShow, object: nil)
        txtFoodName?.textColor = .red
        txtFoodName?.textAlignment = .center
        // Do any additional setup after loading the view.
    }
    @objc func adjustForKeyboard(notification: Notification) {
        if notification.name == .UIKeyboardWillHide {
            print("Keyboard will hide")
        } else if notification.name == .UIKeyboardWillShow {
            print("Keyboard will show")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UITextFieldDelegate
    //Begin editing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textField should begin Editing !")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textField did begin Editing !")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("You typed : \(string)")
        return true
    }
    //End editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textField should end Editing !")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("textField did end Editing.")
    }
    //Press Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textField should return.")
        return true
    }
    @IBAction func btnDismissKeyboard(sender: UIButton) {
        txtFoodName?.resignFirstResponder()
    }
}
