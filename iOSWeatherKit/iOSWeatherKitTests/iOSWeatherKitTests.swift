//
//  iOSWeatherKitTests.swift
//  iOSWeatherKitTests
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//
import Foundation
import XCTest
@testable import iOSWeatherKit

class iOSWeatherKitTests: XCTestCase {

    func testInit() {
        let weatherApi = NetworkManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "2.5")
        XCTAssertEqual("ApiKey", weatherApi.key)
        XCTAssertEqual("2.5", weatherApi.version)
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/", weatherApi.getEndpoint())
    }

    func testGetEndpoint() {
        let weatherApi = NetworkManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "2.5")
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/", weatherApi.getEndpoint())
    }

    func testDefaultParametersAddAPPID() {
       let weatherApi = NetworkManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "")

        XCTAssertEqual(1, weatherApi.defaultParameters.count)

        let queryItem = weatherApi.defaultParameters.first!
        XCTAssertEqual("APPID", queryItem.name)
        XCTAssertEqual("ApiKey", queryItem.value)
    }

    func testAddDefaultParameter() {
        let weatherApi = NetworkManager(key: "ApiKey",apiUrl: "https://api.openweathermap.org",version: "")

        XCTAssertEqual(1, weatherApi.defaultParameters.count)

        weatherApi.addDefaultParameter(name: "lang", value: "FR")
        XCTAssertEqual(2, weatherApi.defaultParameters.count)

        let queryItem = weatherApi.defaultParameters.first!
        XCTAssertEqual("APPID", queryItem.name)
        XCTAssertEqual("ApiKey", queryItem.value)

        let secondItem = weatherApi.defaultParameters[1]
        XCTAssertEqual("lang", secondItem.name)
        XCTAssertEqual("FR", secondItem.value)
    }

    

}
