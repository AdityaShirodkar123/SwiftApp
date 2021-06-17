//
//  DateTableViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 3/27/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class DateTableViewController: UITableViewController {
    
    var datesGiven : [Dates] = []
    var monthNames = [["Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov ", "Dec "], [], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCoreDataInfo()
    }
    
    func getCoreDataInfo() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataDateList = try? context.fetch(Dates.fetchRequest()) as? [Dates] {
                datesGiven = coreDataDateList
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesGiven.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
        let dateGiven = datesGiven[indexPath.row]
        cell.textLabel?.text = monthNames[0][((Int(dateGiven.month!)) ?? 1)-1] + String(dateGiven.day ?? "1") + ", " + String(dateGiven.year ?? "2021")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dateShown = datesGiven[indexPath.row]
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(dateShown)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getCoreDataInfo()
            }

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDate = datesGiven[indexPath.row]
        performSegue(withIdentifier: "goToMeal", sender: selectedDate)
    }
}
