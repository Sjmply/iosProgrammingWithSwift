//
//  ViewController.swift
//  DatePickerExample
//
//  Created by Nguyen Duc Hoang on 8/22/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDate: UILabel?
    @IBOutlet weak var labelTime: UILabel?
    @IBOutlet weak var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker?.datePickerMode = .dateAndTime
//        datePicker?.minimumDate = Date.calculateDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0)
//        datePicker?.maximumDate = Date.calculateDate(day: 31, month: 1, year: 2017, hour: 0, minute: 0)
        datePicker?.minimumDate = Date.calculateDate(day: 1, month: 1, year: 2015, hour: 0, minute: 0)
        datePicker?.maximumDate = Date.calculateDate(day: 31, month: 1, year: 2018, hour: 0, minute: 0)
    }
    @IBAction func valueChanged(sender: UIDatePicker, forEvent event: UIEvent) {
        labelDate?.text = "Day: \(sender.date.getDayMonthYearHourMinuteSecond().day), month: \(sender.date.getDayMonthYearHourMinuteSecond().month), year: \(sender.date.getDayMonthYearHourMinuteSecond().year)"
        labelTime?.text = "Hour: \(sender.date.getDayMonthYearHourMinuteSecond().hour), minute: \(sender.date.getDayMonthYearHourMinuteSecond().minute), second: \(sender.date.getDayMonthYearHourMinuteSecond().second)"
    }
}

