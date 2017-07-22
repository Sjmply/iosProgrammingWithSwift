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
    
    var stackView1:UIStackView = UIStackView()
    
    var txtViewDescription: UITextView = UITextView()
    
    var stackView2:UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.autolayoutMainStackView()
        self.autolayoutStackView1()
        self.autolayoutTextViewDescription()
        self.autolayoutStackView2()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func autolayoutMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        /*
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[mainStackView]-10-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["mainStackView": mainStackView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[mainStackView]-10-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: ["mainStackView": mainStackView]))
         */
        //leadingAnchor && leftAnchor ?
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 20
    }
    private func autolayoutStackView1() {
        mainStackView.addArrangedSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    private func autolayoutTextViewDescription() {
        mainStackView.addArrangedSubview(txtViewDescription)
        txtViewDescription.text = "Your description..."
        txtViewDescription.font = txtViewDescription.font?.withSize(17)
        txtViewDescription.backgroundColor = UIColor(colorLiteralRed: 234.0 / 255.0, green: 221.0 / 255.0, blue: 209.0 / 255.0, alpha: 1)
        txtViewDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func autolayoutStackView2() {
        mainStackView.addArrangedSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.backgroundColor = UIColor.blue
        stackView2.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainStackView.changeBackgroundColor(color: UIColor.cyan)
        stackView1.changeBackgroundColor(color: UIColor.orange)
        stackView2.changeBackgroundColor(color: UIColor.blue)
        print("x123")
    }
    
}


