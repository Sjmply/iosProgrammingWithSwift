//
//  MainViewController.swift
//  CollectionViewExample
//
//  Created by Nguyen Duc Hoang on 7/24/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,
    UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView?
    
    let cellId = "ExampleCell"
    let cellSpacing:CGFloat = 10
    //read data
    var foods: [Food] = foodData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        //auto layout collectionView
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.backgroundColor = .white
        //collectionView settings
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10
        
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ExampleCell")
        collectionView?.register(FoodCollectionCell.self, forCellWithReuseIdentifier: "ExampleCell")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    //    Creating Cells and Supplementary Views
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FoodCollectionCell
        cell.autolayoutCell()
        cell.food = foods[indexPath.row]
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 3 * cellSpacing) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}
