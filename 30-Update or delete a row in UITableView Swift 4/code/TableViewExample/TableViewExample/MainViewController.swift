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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let food = foods[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            self.updateAction(food: food, indexPath: indexPath)
        }
        editAction.backgroundColor = .blue
 
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.deleteAction(food: food, indexPath: indexPath)
        }
        deleteAction.backgroundColor = .red
        return [deleteAction, editAction]
    }
    private func updateAction(food: Food, indexPath: IndexPath) {
        let alert = UIAlertController(title: "Update",
                                      message: "Update a food",
                                      preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        guard let textField = alert.textFields?.first else {
                                            return
                                        }
                                        if let textToEdit = textField.text {
                                            if textToEdit.count == 0 {
                                                return
                                            }
                                            food.foodName = textToEdit
                                            self.tableView?.beginUpdates()
                                            self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                                            self.tableView?.endUpdates()
                                        } else {
                                            return
                                        }
        }
        let cancelAction = UIAlertAction(title: "Cancel ",
                                         style: .default)
        alert.addTextField()
        guard let textField = alert.textFields?.first else {
            return
        }
        textField.placeholder = "Change your food's name "
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func deleteAction(food: Food, indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete",
                                      message: "Are you sure you want to delete food ?",
                                      preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes",
                                         style: .default) { action in
                                            foods.remove(at: indexPath.row)
                                            self.tableView?.deleteRows(at: [indexPath], with: .bottom)
                                            return
                                        }
        let cancelAction = UIAlertAction(title: "No",
                                         style: .default)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            
        }
    }
}
