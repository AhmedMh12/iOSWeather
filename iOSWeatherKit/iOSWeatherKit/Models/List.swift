//
//  List.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

public struct List: Codable {
    public let dt: Int
    public let clouds: Clouds
    public let main: Main
    public let weather: [WeatherData]
    public let wind: Wind
}
