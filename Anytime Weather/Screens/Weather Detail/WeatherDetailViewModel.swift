//
//  WeatherDetailViewModel.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import Foundation

class WeatherDetailViewModel: ObservableObject {
    
    private let weatherService = WeatherService()
    
    @Published var weather = Weather()
    
    var city: String = ""
    
    var date: String {
        ""
    }
    
//    var weather: String {
//        ""
//    }
    
    var temp: String {
        "\(Int(weather.main?.temp ?? 0))"
    }
    
    var maxTemp: String {
        "\(Int(weather.main?.temp_max ?? 0))"
    }
    
    var minTemp: String {
        "\(Int(weather.main?.temp_min ?? 0))"
    }
    
    var feelsLike: String {
        "\(Int(weather.main?.feels_like ?? 0))"
    }
    
    var pressure: String {
        "\(weather.main?.pressure ?? 0)"
    }
    
    var humidity: String {
        "\(weather.main?.humidity ?? 0)"
    }
    
}

extension WeatherDetailViewModel {
    
    func fetchWeather() {
        weatherService.getWeather(city: self.city) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
    
}
