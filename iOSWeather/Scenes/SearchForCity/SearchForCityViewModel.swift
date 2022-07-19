//
//  SearchForCityViewModel.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import Foundation
import iOSWeatherKit

class SearchForCityViewModel {
    let results: Binder<[Weather]> = Binder([])
    let error: Binder<String?> = Binder(nil)
    let isButtonEnabled: Binder<Bool> = Binder(false)
    let isLoadingEnabled: Binder<Bool> = Binder(false)
    let weatherApi = WeatherService()

    var searchText: String? = nil {
        didSet { isButtonEnabled.value = getEnabledFlowStatus() }
    }
    
    func performSearch() {
        guard let gSearchText = searchText else { return }
        
        let search = gSearchText.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        self.isLoadingEnabled.value = true
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
                }
        
    }
    
   
    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let itm = results.value[index]
        return SearchResultViewModel(searchResult: itm)
    }
   
}

private extension SearchForCityViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else { return false }
        return gSearchText.count >= 3
    }
}
