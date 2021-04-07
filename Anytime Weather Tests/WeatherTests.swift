//
//  WeatherTests.swift
//  Anytime Weather Tests
//
//  Created by aku pintar indonesia on 07/04/21.
//

import XCTest

class WeatherTests: XCTestCase {

    private var vm: WeatherDetailViewModel!
    
    override func setUp() {
        super.setUp()
        self.vm = WeatherDetailViewModel(weatherService: MockWeatherService())
    }
    
    func test_TemperatureSuffix() {
        let settings = AppSettings()
        self.vm.settings = settings
        
        settings.unit = Unit.celcius
        XCTAssertEqual(self.vm.suffix, "°C")
        
        settings.unit = Unit.fahrenheit
        XCTAssertEqual(self.vm.suffix, "°F")
    }
    
    func test_CityAvailable() {
        self.vm.city = "Surabaya"
        self.vm.fetchWeather()
        XCTAssertNotNil(vm.weather.main)
    }
    
    func test_CityNotFound() {
        self.vm.city = "Lautan"
        self.vm.fetchWeather()
        XCTAssertNil(vm.weather.main)
    }

}
