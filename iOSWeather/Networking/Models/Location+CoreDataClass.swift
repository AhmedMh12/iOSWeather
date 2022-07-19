//
//  Location+CoreDataClass.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Location", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            
            lat = try values.decodeIfPresent(Double.self, forKey: .lat)!
            lon = try values.decodeIfPresent(Double.self, forKey: .lon)!
           
            
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            
            try container.encode(lat , forKey: .lat)
            try container.encode(lon , forKey: .lon)
           
        } catch {
            print("error")
        }
    }
}
