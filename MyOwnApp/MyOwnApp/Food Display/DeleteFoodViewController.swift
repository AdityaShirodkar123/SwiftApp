//
//  DeleteFoodViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 3/20/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class DeleteFoodViewController: UIViewController {

    var foodsListed : FoodsEaten? = nil

    @IBOutlet weak var foodNameTextField: UILabel!
    
    @IBOutlet weak var caloriesTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodNameTextField.text = foodsListed?.food
        caloriesTextField.text = String(foodsListed?.calories ?? -1) + " calories"
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if foodsListed != nil {
                context.delete(foodsListed!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
}
