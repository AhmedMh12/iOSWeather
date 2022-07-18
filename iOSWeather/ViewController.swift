//
//  ViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import UIKit
import iOSWeatherKit

class ViewController: UIViewController {

    let weatherApi = NetworkManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherApi.getWeatherForLocation(latitude: "5.567788", longitude: "1.5544") { result in
                    switch result {
                        case .success(let weather):
                        print( weather.name)
                        print( "\(weather.main?.celsius)")
                        case .error(_):
                            //Do something
                            break
                    }
                }
    }


}

