//
//  CityListViewModel.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation
import iOSWeatherKit

class CityListViewModel {
    let results: Binder<[Weather]> = Binder([])
    let error: Binder<String?> = Binder(nil)
    let isButtonEnabled: Binder<Bool> = Binder(false)
    let isLoadingEnabled: Binder<Bool> = Binder(false)
    let weatherApi = NetworkManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)

    var searchText: String? = nil {
        didSet { isButtonEnabled.value = getEnabledFlowStatus() }
    }
    
    func performSearch() {
        guard let gSearchText = searchText else { return }
        
        let search = gSearchText.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        
        weatherApi.getCityByName(name: "douz", limit: 5) { result in
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

private extension CityListViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else { return false }
        return gSearchText.count >= 3
    }
}
