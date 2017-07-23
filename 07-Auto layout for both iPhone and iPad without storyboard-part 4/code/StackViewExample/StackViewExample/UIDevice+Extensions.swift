//
//  UIDevice+Extensions.swift
//  StackViewExample
//
//  Created by Nguyen Duc Hoang on 7/23/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    static func setSize(iPhone: CGFloat, iPad: CGFloat) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhone
        case .pad:
            return iPad
        default:
            return 0
        }
    }
}
