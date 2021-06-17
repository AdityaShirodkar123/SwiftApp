//
//  MealTableViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/4/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    var mealsListed : [MealsEaten] = []
    var mealName : String? = nil
    var mealIndex : Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataMealListItems = try? context.fetch(MealsEaten.fetchRequest()) as? [MealsEaten] {
                print(coreDataMealListItems)
                mealsListed = coreDataMealListItems
                tableView.reloadData()
            }
        }
    }
    
    func getCoreDataInfo() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataDateList = try? context.fetch(MealsEaten.fetchRequest()) as? [MealsEaten] {
                mealsListed = coreDataDateList
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsListed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let foodListed = mealsListed[indexPath.row]
        cell.textLabel?.text = foodListed.mealName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let mealShown = mealsListed[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(mealShown)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getCoreDataInfo()
            }

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let progressUpdate = mealsListed[indexPath.row]
        mealName = mealsListed[indexPath.row].mealName
        mealIndex = indexPath.row
        performSegue(withIdentifier: "goToFoodDisplay", sender: progressUpdate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewFoodDisplayVC = segue.destination as? FoodDisplayTableViewController {
            if let mealsListed = sender as? MealsEaten {
                viewFoodDisplayVC.mealsListed = mealsListed
                viewFoodDisplayVC.mealName = mealName
                viewFoodDisplayVC.mealIndex = mealIndex
            }
        }
    }
}
