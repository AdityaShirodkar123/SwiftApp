//
//  FoodDisplayTableViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 3/13/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class FoodDisplayTableViewController: UITableViewController {

    var mealsListed : MealsEaten? = nil
    var mealName : String? = nil
    var mealIndex : Int? = nil
    var foodsListed : [FoodsEaten] = []
    
    @IBOutlet weak var header: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataFoodListItems = try? context.fetch(FoodsEaten.fetchRequest()) as? [FoodsEaten] {
                print(coreDataFoodListItems)
                foodsListed = coreDataFoodListItems
                tableView.reloadData()
            }
        }
        var totalCal = 0
        if foodsListed.count > 0 {
            for i in 0...foodsListed.count-1 {
                totalCal += Int(foodsListed[i].calories)
            }
        }
        header.title = "Total Calories " + String(totalCal)
    }
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsListed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let foodListed = foodsListed[indexPath.row]
        let mealListed = mealsListed!
        if foodsListed.count > 0 {
        cell.textLabel?.text = (((mealListed.foodInside!.member(foodListed.food ?? "error") ?? "error2")) as! String)
       // cell.textLabel?.text =
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let progressUpdate = foodsListed[indexPath.row]
        performSegue(withIdentifier: "goToDelete", sender: progressUpdate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewDeleteFoodVC = segue.destination as? DeleteFoodViewController {
            if let foodsListed = sender as? FoodsEaten {
                viewDeleteFoodVC.foodsListed = foodsListed
                
            }
        }
        if let viewDeleteFoodVC2 = segue.destination as? EnterFoodTableViewController {
            if let mealsListed = sender as? MealsEaten? {
                viewDeleteFoodVC2.mealsListed = mealsListed
                viewDeleteFoodVC2.mealName = mealName
            }
        }
    }

}
