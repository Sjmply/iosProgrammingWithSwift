//
//  UITextField+Extensions.swift
//  StackViewExample
//
//  Created by Nguyen Duc Hoang on 7/23/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    convenience init(placeholder: String?, fontSize: CGFloat, borderStyle: UITextBorderStyle, parentStackView: UIStackView) {
        self.init()
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = self.font?.withSize(fontSize)
        self.borderStyle = borderStyle
        parentStackView.addArrangedSubview(self)
    }
}
