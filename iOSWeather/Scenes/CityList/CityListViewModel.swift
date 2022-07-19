//
//  CityListViewModel.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation
import iOSWeatherKit
import CoreLocation

class CityListViewModel {
    let results: Binder<[Weather]> = Binder([])
    let AddedCites: Binder<[Weather]> = Binder([])
    let error: Binder<String?> = Binder(nil)
    let isButtonEnabled: Binder<Bool> = Binder(false)
    let isLoadingEnabled: Binder<Bool> = Binder(false)
    let weatherApi = WeatherService()
    var currentLocation: CLLocation!
    var searchText: String? = nil {
        didSet { isButtonEnabled.value = getEnabledFlowStatus() }
    }
    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let itm = results.value[index]
        return SearchResultViewModel(searchResult: itm)
    }
    func getCity(at index: Int) -> SearchResultViewModel {
        let itm = AddedCites.value[index]
        return SearchResultViewModel(searchResult: itm)
    }
    
    
    func getMyCityWeather()  {
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            weatherApi.getWeatherForLocation(latitude: "\(currentLocation.coordinate.latitude)", longitude: "\(currentLocation.coordinate.longitude)") { result in
                switch result {
                    case .success(let weather):
                    self.isLoadingEnabled.value = false
                    self.AddedCites.value.append(contentsOf: [weather]) 
                    
                    case .error(_):
                    self.isLoadingEnabled.value = false
                    self.error.value = "*** ERROR ***"
                        break
                }
            }
        }
        
    }
}

private extension CityListViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else { return false }
        return gSearchText.count >= 3
    }
}
