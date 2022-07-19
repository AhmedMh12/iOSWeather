//
//  Utilities.swift
//  iOSWeatherKit
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation

internal let kKelvinZeroInCelsius = 273.15
internal let kFahrenheitZeroInKelvin = -459.67

public func toCelsius(kelvin: Double) -> Double {
    return kelvin - kKelvinZeroInCelsius
}

func toFahrenheit(celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}
