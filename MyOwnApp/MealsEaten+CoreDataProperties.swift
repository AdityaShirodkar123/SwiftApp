//
//  MealsEaten+CoreDataProperties.swift
//  MyOwnApp
//
//  Created by Aditya Shirodkar  on 4/6/21.
//  Copyright © 2021 Aditya Shirodkar . All rights reserved.
//
//

import Foundation
import CoreData


extension MealsEaten {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealsEaten> {
        return NSFetchRequest<MealsEaten>(entityName: "MealsEaten")
    }

    @NSManaged public var mealName: String?
    @NSManaged public var foodInside: NSSet?

    public var wrappedMealName : String {
        mealName ?? "Unknown Meal Name"
    }
    
}

// MARK: Generated accessors for foodInside
extension MealsEaten {

    @objc(addFoodInsideObject:)
    @NSManaged public func addToFoodInside(_ value: FoodsEaten)

    @objc(removeFoodInsideObject:)
    @NSManaged public func removeFromFoodInside(_ value: FoodsEaten)

    @objc(addFoodInside:)
    @NSManaged public func addToFoodInside(_ values: NSSet)

    @objc(removeFoodInside:)
    @NSManaged public func removeFromFoodInside(_ values: NSSet)

}
