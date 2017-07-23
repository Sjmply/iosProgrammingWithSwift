//
//  UILabel+Extensions.swift
//  StackViewExample
//
//  Created by Nguyen Duc Hoang on 7/23/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String?, fontSize: CGFloat, parentStackView: UIStackView) {
        self.init()
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.addArrangedSubview(self)
        self.font = self.font?.withSize(fontSize)
    }
}
