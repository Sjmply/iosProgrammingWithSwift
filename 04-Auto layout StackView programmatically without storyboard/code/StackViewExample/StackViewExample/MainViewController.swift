//
//  MainViewController.swift
//  StackViewExample
//
//  Created by Nguyen Duc Hoang on 7/20/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainStackView:UIStackView = UIStackView()
    //var mainStackView:UIView = UIView()//Use this line for debugging/testing , because setting stackview's background is complicated !
    
    //    var stackView1:UIStackView = UIStackView()
    var stackView1:UIView = UIView()//Use this line for debugging/testing , because setting stackview's background is complicated !
    
    var txtViewDescription: UITextView = UITextView()
    
    //    var stackView2:UIStackView = UIStackView()
    var stackView2:UIView = UIView()//Use this line for debugging/testing , because setting stackview's background is complicated !


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.autolayoutMainStackView()
        self.autolayoutStackView1()
        self.autolayoutStackView2()
        self.autolayoutTextViewDescription()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func autolayoutMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.backgroundColor = .blue
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[mainStackView]-10-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["mainStackView": mainStackView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[mainStackView]-10-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["mainStackView": mainStackView]))
        mainStackView.alignment = .leading //leading = "left"
        mainStackView.distribution = .fillProportionally
    }
    private func autolayoutStackView1() {
        mainStackView.addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.backgroundColor = UIColor.cyan
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[stackView1(100)]",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["stackView1": stackView1]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[stackView1]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["stackView1": stackView1]))
    }
    private func autolayoutStackView2() {
        mainStackView.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.backgroundColor = UIColor.blue
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[stackView2(44)]-0-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["stackView2": stackView2]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[stackView2]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["stackView2": stackView2]))
    }
    
    private func autolayoutTextViewDescription() {
        mainStackView.addSubview(txtViewDescription)
        txtViewDescription.text = "Your description..."
        txtViewDescription.backgroundColor = UIColor(colorLiteralRed: 234.0 / 255.0, green: 221.0 / 255.0, blue: 209.0 / 255.0, alpha: 1)
        txtViewDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[stackView1]-[txtViewDescription]-[stackView2]",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["txtViewDescription": txtViewDescription,
                                                                           "stackView1": stackView1,
                                                                           "stackView2": stackView2
            ]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[txtViewDescription]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["txtViewDescription": txtViewDescription
            ]))

    }
    
}
