//
//  Location+CoreDataProperties.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var lon: Double
    @NSManaged public var lat: Double

}
