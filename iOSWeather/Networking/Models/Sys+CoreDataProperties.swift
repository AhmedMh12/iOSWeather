//
//  Sys+CoreDataProperties.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//
//

import Foundation
import CoreData


extension Sys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sys> {
        return NSFetchRequest<Sys>(entityName: "Sys")
    }

    @NSManaged public var identifier: Int16
    @NSManaged public var type: Int16
    @NSManaged public var message: Double
    @NSManaged public var country: String?
    @NSManaged public var sunrise: Int16
    @NSManaged public var sunset: Int16

}
