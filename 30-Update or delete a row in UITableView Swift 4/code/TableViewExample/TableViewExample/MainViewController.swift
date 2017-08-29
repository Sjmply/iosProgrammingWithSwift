//
//  MainViewController.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK - UITableViewDataSource & UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
        let food:Food = foods[indexPath.row]
        if(food.image != nil) {
            cell.imageViewFood?.image = food.image
        } else {
            cell.imageViewFood?.image = UIImage(named: food.imageName!)
        }
        
        cell.lblFoodName?.text = food.foodName
        cell.lblRating?.text = ""
        for _ in 1...(food.rating ?? 1) {
            cell.lblRating?.text = (cell.lblRating?.text ?? "") + "★"
        }
        cell.lblDescription?.text = food.foodDescription
        return cell
    }
}
