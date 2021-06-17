//
//  AddDateViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 3/27/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class AddDateViewController: UIViewController { //UIPickerViewDataSource, UIPickerViewDelegate
    
    
    var monthNames = [["Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov ", "Dec "], [], []]
    var given = [0, 0, 0]
    let components = Calendar.current.dateComponents([.month,.year, .day], from: Date())
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for j in 1...31 {
            monthNames[1].append(String(j) + " ")
        }
        for i in 1970...2030 {
            monthNames[2].append(String(i))
        }
    }
    
    @IBAction func datePicked(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newDate = Dates(context: context)
            let components = Calendar.current.dateComponents([.month,.year, .day], from: datePicker.date)
           let defaultDate = Calendar.current.dateComponents([.month,.year, .day], from: Date())
            print(String(components.month!))
            newDate.month = String(components.month ?? defaultDate.month!)
            newDate.day = String(components.day ?? defaultDate.day!)
            newDate.year = String(components.year ?? defaultDate.year!)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
