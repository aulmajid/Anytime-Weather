//
//  MockWeatherService.swift
//  Anytime Weather Tests
//
//  Created by aku pintar indonesia on 07/04/21.
//

import Foundation
@testable import Anytime_Weather

class MockWeatherService: WeatherServiceProtocol {
    
    func getWeather(city: String, unit: String, completion: @escaping ((Weather?) -> ())) {
        
    }
    
}
