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
        var result = ""
        if city == "Surabaya" {
            result = #"{ "coord": { "lon": 112.7508, "lat": -7.2492 }, "weather": [ { "id": 500, "main": "Rain", "description": "light rain", "icon": "10d" } ], "base": "stations", "main": { "temp": 302.39, "feels_like": 308.34, "temp_min": 302.15, "temp_max": 302.59, "pressure": 1008, "humidity": 79 }, "visibility": 10000, "wind": { "speed": 5.66, "deg": 280 }, "rain": { "1h": 0.24 }, "clouds": { "all": 40 }, "dt": 1617772878, "sys": { "type": 1, "id": 9363, "country": "ID", "sunrise": 1617748264, "sunset": 1617791453 }, "timezone": 25200, "id": 1625822, "name": "Surabaya", "cod": 200 }"#
        } else {
            result = #"{ "cod": "404", "message": "city not found" }"#
        }
        let jsonData = result.data(using: .utf8)!
        let weather = try? JSONDecoder().decode(Weather.self, from: jsonData)
        completion(weather)
    }
    
}
