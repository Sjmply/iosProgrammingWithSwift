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
        customizeTextField()
        customizeNotificationCenter()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UITextFieldDelegate
    //Begin editing
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textField should begin Editing !")
        return true
    }
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textField did begin Editing !")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("You typed : \(string)")
        return true
    }
    //End editing
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool  {
        print("textField should end Editing !")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("textField did end Editing.")
    }
    //Press Clear
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textField should clear.")
        return true
    }
    //Press Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textField should return.")
        return true
    }
    
    @IBAction func btnDismissKeyboard(sender: UIButton) {
        txtFoodName?.resignFirstResponder()
    }
    
    fileprivate func customizeTextField() {
        txtFoodName?.textColor = .red
        txtFoodName?.borderStyle = .bezel
        txtFoodName?.textAlignment = .center
    }
    //Notifications
    @objc func adjustForKeyboard(notification: Notification) {
        if notification.name == Notification.Name.UIKeyboardWillHide {
            print("Keyboard will hide")
        } else if notification.name == Notification.Name.UIKeyboardWillShow {
            print("Keyboard will show")
        }
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        print("keyboardScreenEndFrame = \(keyboardScreenEndFrame), keyboardViewEndFrame = \(keyboardViewEndFrame)")
    }
    func customizeNotificationCenter() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillShow, object: nil)
    }
}
