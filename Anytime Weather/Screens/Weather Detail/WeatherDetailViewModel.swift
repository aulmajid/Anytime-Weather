//
//  WeatherDetailViewModel.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import Foundation

class WeatherDetailViewModel: ObservableObject {
    
    private let weatherService = WeatherService()
    
    var city: String = ""
    
    var date: String {
        ""
    }
    
    var weather: String {
        ""
    }
    
    var temp: String {
        ""
    }
    
    var maxTemp: String {
        ""
    }
    
    var minTemp: String {
        ""
    }
    
    var feelsLike: String {
        ""
    }
    
    var pressure: String {
        ""
    }
    
    var humidity: String {
        ""
    }
    
}

extension WeatherDetailViewModel {
    
    func fetchWeather() {
        weatherService.getWeather(city: self.city)
    }
    
}
