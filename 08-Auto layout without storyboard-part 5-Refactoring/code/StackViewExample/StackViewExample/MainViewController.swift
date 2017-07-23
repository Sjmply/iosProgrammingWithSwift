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
    
    var imageView: UIImageView = UIImageView()
    
    var labelFirst:UILabel?
    var labelMiddle:UILabel?
    var labelLast:UILabel?
    
    var txtFirst:UITextField?
    var txtMiddle:UITextField?
    var txtLast:UITextField?
    
    var stackView11:UIStackView = UIStackView()
    
    var stackView12:UIStackView = UIStackView()
    
    var txtViewDescription: UITextView = UITextView()
    
    var stackView2:UIStackView = UIStackView()
    
    var btnCancel:UIButton = UIButton()
    var btnSave:UIButton = UIButton()
    var btnClear:UIButton = UIButton()
    
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
        //leadingAnchor && leftAnchor ?
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: UIDevice.setSize(iPhone: 30, iPad: 50)).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                              constant: -UIDevice.setSize(iPhone: 10, iPad: 20)).isActive = true
        
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
    }
    private func autolayoutStackView1() {
        mainStackView.addArrangedSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.heightAnchor.constraint(equalToConstant: UIDevice.setSize(iPhone: 100, iPad: 200)).isActive = true
        
        //stackView1 settings
        stackView1.axis = .horizontal
        stackView1.alignment = .fill
        stackView1.distribution = .fill
        stackView1.spacing = UIDevice.setSize(iPhone: 10, iPad: 20)
        
        //Autolayout for image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "flower")
        imageView.backgroundColor = UIColor.red
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        stackView1.addArrangedSubview(imageView)
        
        //Autolayout for stackView11
        stackView11.translatesAutoresizingMaskIntoConstraints = false
        stackView1.addArrangedSubview(stackView11)
        stackView11.axis = .vertical
        stackView11.alignment = .leading
        stackView11.distribution = .equalCentering
        stackView11.spacing = 10
        
        labelFirst = UILabel(text: "First", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: stackView11)
        labelMiddle = UILabel(text: "Middle", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: stackView11)
        labelLast = UILabel(text: "Last", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22), parentStackView: stackView11)
        
        stackView11.widthAnchor.constraint(equalToConstant: UIDevice.setSize(iPhone: 70, iPad: 100)).isActive = true
        
        //Autolayout for stackView12
        stackView12.translatesAutoresizingMaskIntoConstraints = false
        stackView1.addArrangedSubview(stackView12)
        stackView12.axis = .vertical
        stackView12.alignment = .fill
        stackView12.distribution = .equalSpacing
        stackView12.spacing = 0
        
        txtFirst = UITextField(placeholder: "First", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22),
                                   borderStyle: .roundedRect, parentStackView: stackView12)
        txtMiddle = UITextField(placeholder: "Middle", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22),
                                    borderStyle: .roundedRect, parentStackView: stackView12)
        txtLast = UITextField(placeholder: "Last", fontSize: UIDevice.setSize(iPhone: 15, iPad: 22),
                                  borderStyle: .roundedRect, parentStackView: stackView12)
    }
    private func autolayoutTextViewDescription() {
        mainStackView.addArrangedSubview(txtViewDescription)
        txtViewDescription.text = "Your description..."
        txtViewDescription.font = txtViewDescription.font?.withSize(UIDevice.setSize(iPhone: 15, iPad: 22))
        txtViewDescription.backgroundColor = UIColor(234, 221, 209)
        txtViewDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func autolayoutStackView2() {
        mainStackView.addArrangedSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.backgroundColor = UIColor.blue
        stackView2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //autolayout 3 buttons
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        btnCancel.backgroundColor = UIColor(121, 200, 166)
        btnCancel.setTitle("Cancel", for: .normal)
        btnCancel.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnCancel)
        
        btnSave.translatesAutoresizingMaskIntoConstraints = false
        btnSave.backgroundColor = UIColor(121, 200, 166)
        btnSave.setTitle("Save", for: .normal)
        btnSave.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnSave)
        
        btnClear.translatesAutoresizingMaskIntoConstraints = false
        btnClear.backgroundColor = UIColor(121, 200, 166)
        btnClear.setTitle("Clear", for: .normal)
        btnClear.setTitleColor(.white, for: .normal)
        stackView2.addArrangedSubview(btnClear)
        
        //autolayout button's height
        btnCancel.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        btnSave.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        btnClear.heightAnchor.constraint(equalTo: stackView2.heightAnchor, multiplier: 1).isActive = true
        //stackView2 settings
        stackView2.axis = .horizontal
        stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        stackView2.spacing = 10
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        mainStackView.changeBackgroundColor(color: UIColor.cyan)
//        stackView1.changeBackgroundColor(color: UIColor.orange)
//        stackView2.changeBackgroundColor(color: UIColor.blue)
//        print("x123")
    }
    
}


