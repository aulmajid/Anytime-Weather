//
//  SearchTests.swift
//  Anytime Weather Tests
//
//  Created by aku pintar indonesia on 07/04/21.
//

import XCTest

class SearchTests: XCTestCase {
    
    private var vm: SearchViewModel!
    
    override func setUp() {
        super.setUp()
        self.vm = SearchViewModel()
    }
    
    func test_SearchRecommendsHistory_InputEmpty() {
        let keywords = self.vm.getRecommendations(keyword: "")
        for keyword in keywords {
            XCTAssertEqual(keyword.isHistory, true)
        }
    }
    
    func test_SearchRecommendsNewKeywords_InputNotEmpty() {
        let keywords = self.vm.getRecommendations(keyword: "Solo")
        for keyword in keywords {
            XCTAssertEqual(keyword.isHistory, false)
        }
    }
    
    func test_TemperatureSuffix() {
        let settings = AppSettings()
        let vm = WeatherDetailViewModel(weatherService: MockWeatherService())
        vm.settings = settings
        
        settings.unit = Unit.celcius
        XCTAssertEqual(vm.suffix, "°C")
        
        settings.unit = Unit.fahrenheit
        XCTAssertEqual(vm.suffix, "°F")
    }

}
