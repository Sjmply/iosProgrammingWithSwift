//
//  ViewController.swift
//  PickerViewExample
//
//  Created by Nguyen Duc Hoang on 8/21/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var lblSelectedItem:UILabel?
    @IBOutlet weak var pickerView: UIPickerView?
    var flowerNames = ["Rose","Lily","Holly","Jasmine", "Daisy", "Alyssum", "Violet", "Ivy"]
    let rowHeight:CGFloat = 50.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView?.selectRow(flowerNames.count / 2, inComponent: 0, animated: true)
        lblSelectedItem?.text = flowerNames[flowerNames.count / 2]
    }
    //MARK - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowerNames.count
    }
    //MARK - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowerNames[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSelectedItem?.text = flowerNames[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label:UILabel?
        if(view == nil) {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: rowHeight))
        } else {
            label = view as? UILabel
        }
        label!.text = flowerNames[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 18)
        label?.textColor = .white
        label?.backgroundColor = .darkGray
        return label!
    }
}
