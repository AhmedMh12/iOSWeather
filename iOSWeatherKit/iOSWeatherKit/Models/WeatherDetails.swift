//
//  WeatherDetails.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

public struct WeatherDetails: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}
