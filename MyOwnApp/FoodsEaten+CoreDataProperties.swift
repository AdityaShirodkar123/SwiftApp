//
//  FoodsEaten+CoreDataProperties.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/6/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//
//

import Foundation
import CoreData


extension FoodsEaten {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodsEaten> {
        return NSFetchRequest<FoodsEaten>(entityName: "FoodsEaten")
    }

    @NSManaged public var calories: Int32
    @NSManaged public var food: String?
    @NSManaged public var insideMeal: MealsEaten?
    
    public var wrappedFood : String {
        food ?? "Unknown Food"
    }
}
