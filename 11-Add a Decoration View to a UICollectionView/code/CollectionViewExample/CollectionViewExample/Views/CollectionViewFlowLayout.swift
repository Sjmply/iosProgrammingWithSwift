//
//  CollectionViewFlowLayout.swift
//  CollectionViewExample
//
//  Created by Nguyen Duc Hoang on 7/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .vertical        
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        //DecorationView
        self.register(DecorationView.self, forDecorationViewOfKind: "DecorationView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepare() {
        super.prepare()
        
    }
    // Return attributes of all items (cells, supplementary views, decoration views) that appear within this rect
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        for attribute in attributes! {
            
        }
        return attributes
    }
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
    }
}
