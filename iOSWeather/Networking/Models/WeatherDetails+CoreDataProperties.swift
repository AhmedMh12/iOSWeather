//
//  WeatherDetails+CoreDataProperties.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//
//

import Foundation
import CoreData


extension WeatherDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDetails> {
        return NSFetchRequest<WeatherDetails>(entityName: "WeatherDetails")
    }

    @NSManaged public var identifier: Int16
    @NSManaged public var main: String?
    @NSManaged public var desc: String?
    @NSManaged public var icon: String?

}
