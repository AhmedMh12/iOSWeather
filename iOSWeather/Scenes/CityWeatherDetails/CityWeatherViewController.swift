//
//  CityWeatherViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import UIKit
import iOSWeatherKit

class CityWeatherViewController: UIViewController {
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    let viewModel = CityWeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: SetUpView
    
    func setupVC() {
        cityName.text = viewModel.weather?.name
        weatherDesc.text = viewModel.weather?.weather?.first?.description
        if viewModel.weather?.weather?.first?.main == "Clear" && viewModel.weather?.clouds?.all == 0 {
            backgroundImg.image = UIImage(named: "Sunny")
        }
        else if viewModel.weather?.weather?.first?.main == "Clouds" &&  viewModel.weather?.clouds?.all ?? 0 > 0 {
            backgroundImg.image = UIImage(named: "Clouds")
        }
        else if viewModel.weather?.weather?.first?.main == "Rain" &&  viewModel.weather?.clouds?.all ?? 0 > 0 {
            backgroundImg.image = UIImage(named: "Rain")
        }
        else {
            backgroundImg.image = UIImage(named: "Sunny")
        }
        if let tempValue = viewModel.weather?.main?.temp {
            let celsiusValue = viewModel.toCelsius(kelvin: tempValue)
            temp.text =  String(format: "%.0f °C", celsiusValue)
        }
        if let speed = viewModel.weather?.wind?.speed {
            windSpeed.text = String(format: "%.0f", speed)
        }
    }
    
}
