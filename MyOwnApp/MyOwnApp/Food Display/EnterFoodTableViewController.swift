//
//  EnterFoodTableViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/2/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class EnterFoodTableViewController: UITableViewController, UISearchBarDelegate {

    var mealsListed : MealsEaten? = nil
    var mealName : String? = nil
    let data : [String: Int32] = ["Apple": 95, "Orange": 45, "Banana": 105]
    var filteredData: [String] = []
    var foodsListed : FoodsEaten? = nil
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        for (name, _) in data {
            filteredData.append(name)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hardcodedData")! as UITableViewCell

        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }

    // MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            for (name, _) in data {
                var i = 0
                filteredData.append(name)
                i += 1
            }
        }
        else {
            for (food, _) in data {
                if  food.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(food)
                }
            }
        }
        
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newFood = FoodsEaten(context: context)
            let oldMeal = MealsEaten(context: context)
            oldMeal.removeFromFoodInside(newFood)
            newFood.food = filteredData[indexPath.row]
            newFood.calories = data[filteredData[indexPath.row]] ?? -1
            oldMeal.addToFoodInside(newFood)
                (UIApplication.shared.delegate as?
                    AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
        }
    }
    
}
