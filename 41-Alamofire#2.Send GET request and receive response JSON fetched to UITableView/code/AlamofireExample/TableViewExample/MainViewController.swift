//
//  MainViewController.swift
//  TableViewExample
//
//  Created by Nguyen Duc Hoang on 8/27/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView?
    var foods: [[String: Any]] = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://nguyens-imac:3001/list_all_foods").responseJSON { (response) in
            if let responseValue = response.result.value as! [String: Any]? {
                if let responseFoods = responseValue["data"] as! [[String: Any]]? {
                    self.foods = responseFoods
                    self.tableView?.reloadData()
                    print("assss")
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    //MARK - UITableViewDataSource & UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
        if foods.count > 0 {
            let eachFood = foods[indexPath.row]
            cell.lblFoodName?.text = (eachFood["name"] as? String) ?? ""
            cell.lblDescription?.text = (eachFood["foodDescription"] as? String) ?? ""
        }
        return cell
    }
}
