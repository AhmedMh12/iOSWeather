//
//  Wind.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

public struct Wind: Codable {
    public let speed: Double?
    public let deg: Double?

    public var direction: String {
        get {
            if deg == 0 || deg == 360 {
                return "N"
            } else if deg == 45 {
                return "NE"
            } else if deg == 90 {
                return "E"
            } else if deg == 135 {
                return "SE"
            } else if deg == 180 {
                return "S"
            } else if deg == 270 {
                return "W"
            }

            return "N"
        }
    }
}
