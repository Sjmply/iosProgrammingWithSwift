//
//  NewFoodViewController.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/28/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var txtFoodName: UITextField?
    @IBOutlet weak var imageViewFood: UIImageView?
    @IBOutlet weak var lblRating: UILabel?
    var newFood = Food()
    
    @IBAction func btnSave(sender: UIButton) {
        print("press Save !")
        if (newFood.image == nil || newFood.rating ?? 0 < 1 || newFood.foodName?.count == 0) {
            let alertController = UIAlertController(title: "Alert", message: "Please set food's name, choose image, rating ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            //Add newFood to foods array
            foods.append(newFood)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? MainViewController
            mainViewController?.tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tap to imageview
        let tapGestureToImageView = UITapGestureRecognizer(target: self, action: #selector(tapToImageView(sender:)))
        tapGestureToImageView.numberOfTapsRequired = 1
        imageViewFood?.isUserInteractionEnabled = true
        imageViewFood?.addGestureRecognizer(tapGestureToImageView)
        // Do any additional setup after loading the view.
        //pan to lblRating
        let panGestureToLabelRating = UIPanGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        lblRating?.isUserInteractionEnabled = true
        lblRating?.addGestureRecognizer(panGestureToLabelRating)
        //tap to lblRating
        let tapGestureToLabelRating = UITapGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        tapGestureToLabelRating.numberOfTapsRequired = 1
        lblRating?.addGestureRecognizer(tapGestureToLabelRating)
    }
    @objc func tapToImageView(sender: UITapGestureRecognizer) {
        print("tap to imageView")
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary;
        self.present(pickerController, animated: true, completion: nil)
    }
    //MARK - UINavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageViewFood!.image = chosenImage
        newFood.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func panInLabelRating(sender: UIGestureRecognizer) {
        let locationInView = sender.location(in: self.view) //your finger position
        let newLabelRatingFrame = self.view.convert(lblRating!.frame, from: lblRating!.superview)
        let frame1 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame2 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: 2 * newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame3 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: 3 * newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame4 = CGRect(x: newLabelRatingFrame.origin.x,
                            y: newLabelRatingFrame.origin.y,
                            width: 4 * newLabelRatingFrame.size.width / 5,
                            height: newLabelRatingFrame.size.height)
        let frame5 = newLabelRatingFrame
        if (frame1.contains(locationInView)) {
            lblRating?.text = "★☆☆☆☆"
            newFood.rating = 1
        } else if (frame2.contains(locationInView)) {
            lblRating?.text = "★★☆☆☆"
            newFood.rating = 2
        } else if (frame3.contains(locationInView)) {
            lblRating?.text = "★★★☆☆"
            newFood.rating = 3
        } else if (frame4.contains(locationInView)) {
            lblRating?.text = "★★★★☆"
            newFood.rating = 4
        } else if (frame5.contains(locationInView)) {
            lblRating?.text = "★★★★★"
            newFood.rating = 5
        }
    }
    //MARK -- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        newFood.foodName = textField.text ?? ""
        textField.resignFirstResponder()
    }
}
