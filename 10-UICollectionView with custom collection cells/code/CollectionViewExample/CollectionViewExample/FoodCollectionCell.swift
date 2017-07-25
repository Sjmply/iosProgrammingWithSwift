//
//  FoodCollectionCell.swift
//  CollectionViewExample
//
//  Created by Nguyen Duc Hoang on 7/25/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class FoodCollectionCell: UICollectionViewCell {
    var imageView: UIImageView = UIImageView()
    var labelFoodName: UILabel = UILabel()
    var labelFoodDescription: UILabel = UILabel()
    var stackView: UIStackView = UIStackView()
    
//auto layout collection cell
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    func autolayoutCell() {
        self.backgroundColor = .cyan
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //autolayout imageView
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        imageView.image = #imageLiteral(resourceName: "salad-mushroom")
        
        //autolayout labelFoodName
        labelFoodName.translatesAutoresizingMaskIntoConstraints = false
        labelFoodName.text = "hello hello hello hello hello hello hello hello hello"
        labelFoodName.numberOfLines = 1
        stackView.addArrangedSubview(labelFoodName)
        
        //autolayout labelFoodName
        labelFoodDescription.translatesAutoresizingMaskIntoConstraints = false
        labelFoodDescription.text = "description description description. description description description description description"
        labelFoodDescription.numberOfLines = 1
        stackView.addArrangedSubview(labelFoodDescription)
        
        //bottom of labelFoodDescription
//        labelFoodDescription.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10).isActive = true
        
        //stackView setting
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10 
    }
    
    var food: Food! {
        didSet {
            imageView.image = UIImage(named: food.foodName!)
            labelFoodName.text = food.foodName ?? ""
            labelFoodDescription.text = food.foodDescription ?? ""
        }
    }
}
