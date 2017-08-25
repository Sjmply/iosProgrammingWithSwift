//
//  CustomSegue.swift
//  ScenesAndSeguesExample
//
//  Created by Nguyen Duc Hoang on 8/24/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        // Assign the source and destination views to local variables.
        let firstVCView = self.source.view as UIView!
        let secondVCView = self.destination.view as UIView!
        // Get the screen width and height.
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        firstVCView!.frame = CGRect(x: firstVCView!.frame.origin.x, y: firstVCView!.frame.origin.y, width: screenWidth, height: screenHeight)
        secondVCView!.frame = CGRect(x: secondVCView!.frame.origin.x, y: secondVCView!.frame.origin.y, width: 0, height: 0)
        firstVCView!.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        secondVCView!.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView!, aboveSubview: firstVCView!)
        UIView.animate(withDuration: 0.5, animations: {
            firstVCView!.frame = CGRect(x: firstVCView!.frame.origin.x, y: firstVCView!.frame.origin.y, width: 0, height: 0)
            secondVCView!.frame = CGRect(x: secondVCView!.frame.origin.x, y: secondVCView!.frame.origin.y, width: screenWidth, height: screenHeight)
            firstVCView!.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
            secondVCView!.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        }) { (finished) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
        
        
    }
}
