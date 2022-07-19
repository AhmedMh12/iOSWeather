//
//  Clouds+CoreDataProperties.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//
//

import Foundation
import CoreData


extension Clouds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clouds> {
        return NSFetchRequest<Clouds>(entityName: "Clouds")
    }

    @NSManaged public var all: Int16

}
