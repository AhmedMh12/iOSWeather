iOSWeather


iOSWeather is a app that use iOSWeatherKit written in Swift 5.

Requirements
iOS 11.0+ 


Installation

In Order to use iOSWeatherKit , you can integrate the framework into your project manually.You can install the framework from : https://github.com/AhmedMh12/iOSWeatherKit

Code Implementation

First:

import iOSWeatherKit
In your view controller's

then:

create a WeatherService.swift File :

import Foundation
import iOSWeatherKit

public class WeatherService {
    
    let weatherService = NetworkManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)
    
    public func getCityByName(name: String,limit:Int,completion: @escaping (Result<Weather>) -> Void) {
        weatherService.send(to: "weather", with: ["q": name], completion: completion)
    }
    
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (Result<Weather>) -> Void) {
        weatherService.send(to: "weather", with: ["lat": latitude, "lon": longitude], completion: completion)
    }

}

Finally:

create an instance of your weatherserviceFile 

   let weatherApi = WeatherService()
   
   and now you can call the api and get your response
   
   weatherApi.getCityByName(name: search, limit: 5) { result in
            switch result {
            case .success(let weather):
                self.isLoadingEnabled.value = false
                self.results.value = [weather]
                
            case .error(_):
                self.isLoadingEnabled.value = false
                self.error.value = "*** ERROR ***"
                break
            }
