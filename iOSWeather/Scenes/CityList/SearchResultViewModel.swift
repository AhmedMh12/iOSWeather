//
//  SearchResultViewModel.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation
import iOSWeatherKit

class SearchResultViewModel {
    
    private var searchResult: Weather
    
    init(searchResult: Weather) {
        self.searchResult = searchResult
    }
    
    var trackName: String {
        searchResult.name ?? "---"
    }
    
    var collectionName: String {
        searchResult.name ?? "---"
    }
}
