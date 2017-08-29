//
//  Food.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit
class Food {
    var imageName: String?
    var image: UIImage?
    var foodName: String?
    var rating: Int?
    var foodDescription: String?
    convenience init(imageName: String, foodName: String, rating: Int, foodDescription: String) {
        self.init()
        self.imageName = imageName
        self.foodName = foodName
        self.rating = rating
        self.foodDescription = foodDescription
    }
}
