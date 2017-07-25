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
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        collectionViewFlowLayout.minimumLineSpacing = 5
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ExampleCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    //    Creating Cells and Supplementary Views
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan: .orange       
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//        let width = (UIScreen.main.bounds.size.width - 3 * 10) / 2
//        let height = width
        let width = (UIScreen.main.bounds.size.width - 3 * 10) / 2
        let height = (UIScreen.main.bounds.size.height - 4 * 10) / 3
        return CGSize(width: width, height: height)
    }
}
