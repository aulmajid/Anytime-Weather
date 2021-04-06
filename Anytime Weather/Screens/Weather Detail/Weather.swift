//
//  Weather.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import Foundation

struct Weather: Decodable {
    var main: Weather_main?
    var weather: [Weather_weather]?
    var timezone: Int?
}

struct Weather_main: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
}

struct Weather_weather: Decodable {
    var main: String?
    var description: String?
    var icon: String?
}
