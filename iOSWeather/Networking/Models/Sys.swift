//
//  Sys.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

public struct Sys: Codable {
    public let id: Int?
    public let type: Int?
    public let message: Double?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?
}
