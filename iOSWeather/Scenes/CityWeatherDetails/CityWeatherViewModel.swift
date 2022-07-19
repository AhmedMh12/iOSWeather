//
//  CityWeatherViewModel.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import Foundation

class CityWeatherViewModel {
    var weather : Weather?
    internal let kKelvinZeroInCelsius = 273.15
    internal let kFahrenheitZeroInKelvin = -459.67

    public func toCelsius(kelvin: Double) -> Double {
        return kelvin - kKelvinZeroInCelsius
    }

    func toFahrenheit(celsius: Double) -> Double {
        return celsius * 9 / 5 + 32
    }
}
