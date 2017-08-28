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
        
        //tap to imageview
        let tapGestureToImageView = UITapGestureRecognizer(target: self, action: #selector(tapToImageView(sender:)))
        tapGestureToImageView.numberOfTapsRequired = 1
        imageViewFood?.isUserInteractionEnabled = true
        imageViewFood?.addGestureRecognizer(tapGestureToImageView)
        //pan to lblRating
        let panGestureToLabelRating = UIPanGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        lblRating?.isUserInteractionEnabled = true
        lblRating?.addGestureRecognizer(panGestureToLabelRating)
        
        let tapGestureToLabelRating = UITapGestureRecognizer(target: self, action: #selector(panInLabelRating(sender:)))
        tapGestureToLabelRating.numberOfTapsRequired = 1
        lblRating?.addGestureRecognizer(tapGestureToLabelRating)
    }
    
    @objc func panInLabelRating(sender: UIGestureRecognizer) {
        let locationInView = sender.location(in: self.view)
        let newLabelRatingFrame = self.view.convert(lblRating!.frame, from: lblRating!.superview)
        let frame1 = CGRect(x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: newLabelRatingFrame.size.width / 5, height: newLabelRatingFrame.size.height)
        let frame2 = CGRect(x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 2 * newLabelRatingFrame.size.width / 5, height: newLabelRatingFrame.size.height)
        let frame3 = CGRect(x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 3 * newLabelRatingFrame.size.width / 5, height: newLabelRatingFrame.size.height)
        let frame4 = CGRect(x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 4 * newLabelRatingFrame.size.width / 5, height: newLabelRatingFrame.size.height)
        let frame5 = newLabelRatingFrame
        if (frame1.contains(locationInView)) {
            lblRating?.text = "★☆☆☆☆"
        } else if (frame2.contains(locationInView)) {
            lblRating?.text = "★★☆☆☆"
        } else if (frame3.contains(locationInView)) {
            lblRating?.text = "★★★☆☆"
        } else if (frame4.contains(locationInView)) {
            lblRating?.text = "★★★★☆"
        } else if (frame5.contains(locationInView)) {
            lblRating?.text = "★★★★★"
        }
    }
    
    @objc func tapToImageView(sender: UITapGestureRecognizer) {
        print("tap to imageView")
    }
    //MARK -- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        return true
    }
}
