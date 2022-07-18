//
//  Forecast.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

public struct Forecast: Codable {
    public let city: City
    public let list: [List]
}
