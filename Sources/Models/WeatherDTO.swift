//
//  WeatherDTO.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import Foundation

struct WeatherDTO: Decodable {
    var main: WeatherMain?
    var weather: [Weather]?
    var timezone: Double?
}

struct WeatherMain: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
}

struct Weather: Decodable {
    var main: String?
    var description: String?
    var icon: String?
}
