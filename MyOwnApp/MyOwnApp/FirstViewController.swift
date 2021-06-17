//
//  FirstViewController.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/17/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {

    @IBOutlet weak var titleBar: UINavigationItem!
    
    var datesGiven : [Dates] = []
    let monthNames = ["Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov ", "Dec "]
    var monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultDate = Calendar.current.dateComponents([.month,.year, .day], from: Date())
        var titleSubscript : Int = 0
        if datesGiven.count > 0 {
            for i in 0...datesGiven.count-1 {
                if datesGiven[i].month == monthNames[(defaultDate.month ?? 0)-1] {
                    if datesGiven[i].year == String(defaultDate.year ?? 2021) {
                        if datesGiven[i].day == String(defaultDate.day ?? 0) {
                            titleSubscript = i
                        }
                    }
                }
            }
            let dateGiven = datesGiven[titleSubscript]
            let dGMonth = monthNames[((Int(dateGiven.month!)) ?? 1)-1]
            let dGDay = dateGiven.day ?? "1"
            let dGYear = dateGiven.year ?? "2021"
            titleBar.title = dGMonth + String(dGDay) + ", " + String(dGYear)
        } else {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let newDate = Dates(context: context)
                newDate.month = String(defaultDate.month ?? 0)
                newDate.day = String(defaultDate.day!+1)
                newDate.year = String(defaultDate.year ?? 2021)
                
                if (defaultDate.day! >= monthDays[defaultDate.month!-1]) {
                    if (defaultDate.month! > 12) {
                        newDate.year = String(defaultDate.year!+1)
                    }
                }
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func leftTapped(_ sender: Any) {
    }
    
    @IBAction func rightTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
