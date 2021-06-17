//
//  AddMealViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/4/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var mealTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newMeal = MealsEaten(context: context)
            if let given = mealTextField.text {
                newMeal.mealName = given
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }

}
