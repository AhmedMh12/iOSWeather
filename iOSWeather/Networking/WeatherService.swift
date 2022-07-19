//
//  WeatherService.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import Foundation
import iOSWeatherKit
import CoreData
import UIKit

public class WeatherService {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

   
    
    public func getCityByName(name: String,limit:Int,completion: @escaping (Result<Weather>) -> Void) {
        var persistentContainer = appDelegate.persistentContainer
        let weatherService = NetworkManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version,persistanceContainer: persistentContainer)
        weatherService.send(to: "weather", with: ["q": name], completion: completion)
    }
    
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (Result<Weather>) -> Void) {
        var persistentContainer = appDelegate.persistentContainer
        let weatherService = NetworkManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version,persistanceContainer: persistentContainer)
        weatherService.send(to: "weather", with: ["lat": latitude, "lon": longitude], completion: completion)
    }

}
