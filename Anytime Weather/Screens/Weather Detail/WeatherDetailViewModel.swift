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
    var settings: AppSettings?
    var backgroundImage = ""
    
}

extension WeatherDetailViewModel {
    
    private var suffix: String {
        settings?.unit.suffix ?? ""
    }
    
    private var now: Date {
        let timeInterval = (weather.timezone ?? 0) - Double(TimeZone.current.secondsFromGMT())
        return Date(timeIntervalSinceNow: timeInterval)
    }
    
    var time: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH.mm")
        let data_HHmm = formatter.string(from: self.now)
        return "\(data_HHmm)"
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        let date_EEEE = formatter.string(from: self.now)
        formatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        let date_MMMMdyyyy = formatter.string(from: self.now)
        return "\(date_EEEE), \(date_MMMMdyyyy)"
    }
    
    var lastUpdated: String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH.mm")
        let data_HHmm = formatter.string(from: now)
        return "Last updated: \(data_HHmm)"
    }
    
    var temp: String {
        "\(Int(weather.main?.temp ?? 0))" + suffix
    }
    
    var maxTemp: String {
        "\(Int(weather.main?.temp_max ?? 0))" + suffix
    }
    
    var minTemp: String {
        "\(Int(weather.main?.temp_min ?? 0))" + suffix
    }
    
    var feelsLike: String {
        "Feels like \(Int(weather.main?.feels_like ?? 0))" + suffix
    }
    
    var pressure: String {
        "\(weather.main?.pressure ?? 0)"
    }
    
    var humidity: String {
        "\(weather.main?.humidity ?? 0)"
    }
    
    var condition: String {
        "\(weather.weather?[0].main ?? "") (\(weather.weather?[0].description ?? ""))"
    }
    
    var iconURL: String {
        if let icon = weather.weather?[0].icon {
            return "https://openweathermap.org/img/wn/\(icon)@2x.png"
        } else {
            return ""
        }
    }
    
    var iconFileName: String {
        "\(weather.weather?[0].description ?? "").png"
    }
    
}

extension WeatherDetailViewModel {
    
    func fetchWeather() {
        weatherService.getWeather(city: self.city, unit: settings?.unit.apiParam ?? "metric") { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
    
    func fetchBackgroundImage() {
        self.backgroundImage = ["bg1", "bg2", "bg3", "bg4", "bg5", "bg6"].randomElement()!
    }
    
}
