//
//  CityWeatherViewController.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import UIKit
import iOSWeatherKit

class CityWeatherViewController: UIViewController {
    var cityWeather: Weather?
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = cityWeather?.name
        weatherDesc.text = cityWeather?.weather?.first?.description
        if cityWeather?.weather?.first?.main == "Clear" && cityWeather?.clouds?.all == 0 {
            backgroundImg.image = UIImage(named: "Sunny")
        }
        else if cityWeather?.weather?.first?.main == "Clouds" &&  cityWeather?.clouds?.all ?? 0 > 0 {
            backgroundImg.image = UIImage(named: "Clouds")
        }
        else if cityWeather?.weather?.first?.main == "Rain" &&  cityWeather?.clouds?.all ?? 0 > 0 {
            backgroundImg.image = UIImage(named: "Rain")
        }
        else {
            backgroundImg.image = UIImage(named: "Sunny")
        }
        if let tempValue = cityWeather?.main?.celsius {
            temp.text =  String(format: "%.0f °C", tempValue)
        }
        if let speed = cityWeather?.wind?.speed {
            windSpeed.text = String(format: "%.0f", speed)
        }
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
