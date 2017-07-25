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
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.changeBackgroundColor(color: .red)
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //autolayout imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: (2.0 / 3.0)*self.frame.height).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant:self.frame.width)
        imageView.image = #imageLiteral(resourceName: "salad-mushroom")
        stackView.addArrangedSubview(imageView)
        //autolayout labelFoodName
        labelFoodName.translatesAutoresizingMaskIntoConstraints = false
        labelFoodName.text = "hello"
        labelFoodName.textColor = .white
        labelFoodName.numberOfLines = 1
        stackView.addArrangedSubview(labelFoodName)
        //stackView setting
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
    }
    
    var food: Food! {
        didSet {
            imageView.image = UIImage(named: food.foodName!)
            labelFoodName.text = food.foodName ?? ""
            labelFoodDescription.text = food.foodDescription ?? ""
        }
    }
}
