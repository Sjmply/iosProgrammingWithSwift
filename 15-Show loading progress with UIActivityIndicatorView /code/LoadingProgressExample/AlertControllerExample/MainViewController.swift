//
//  MainViewController.swift
//  AlertControllerExample
//
//  Created by Nguyen Duc Hoang on 8/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var btnChooseImageSource:UIButton?
    @IBOutlet weak var imageView:UIImageView?
    
    var alertController: UIAlertController?
    var pickerController: UIImagePickerController?
    
    @IBAction func btnChooseImageSource(sender: UIButton) {
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
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) { (action) in
            print("You choose Photo")
            self.openPhoto()
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.magenta
        self.present(alertController!, animated: true) {
            print("presented")
        }
    }
    func openCamera() {
        pickerController = UIImagePickerController()
        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
            return
        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true) {
            print("presented Camera")
        }
    }
    func openPhoto() {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary;
        self.present(pickerController!, animated: true, completion: nil)
    }
    //MARK - UINavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        picker.dismiss(animated: true, completion: {
            let activityindicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            activityindicatorView.color = UIColor.red
            self.view.addSubview(activityindicatorView)
            activityindicatorView.frame = self.view.frame
            activityindicatorView.center = self.view.center
            activityindicatorView.startAnimating()
            DispatchQueue.global().async {
                //Do some heavy tasks ?
                for index in 1...10000000 {
                    print(index)
                }
                //After finishing heavy tasks, stop animationing and load image
                DispatchQueue.main.async {
                    self.imageView?.image = chosenImage
                    activityindicatorView.stopAnimating()
                }
            }
        })
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
