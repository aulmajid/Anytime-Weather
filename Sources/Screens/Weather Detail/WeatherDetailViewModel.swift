//
//  WeatherDetailViewModel.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import Foundation

class WeatherDetailViewModel: ObservableObject {
    private let weatherService: WeatherServiceProtocol

    @Published var weather = WeatherDTO()
    @Published var isLoading = false
    @Published var timeRefresher = 0

    var city: String = ""
    var settings: AppSettings?
    var backgroundImage = ""

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
}

extension WeatherDetailViewModel {
    var suffix: String {
        settings?.unit.suffix ?? ""
    }

    private var now: Date {
        let timeInterval = (weather.timezone ?? 0) - Double(TimeZone.current.secondsFromGMT())
        return Date(timeIntervalSinceNow: timeInterval)
    }

    var time: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH.mm.ss")
        let data_HHmm = formatter.string(from: now)
        return "\(data_HHmm)"
    }

    var date: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        let date_EEEE = formatter.string(from: now)
        formatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        let date_MMMMdyyyy = formatter.string(from: now)
        return "\(date_EEEE), \(date_MMMMdyyyy)"
    }

    var lastUpdated: String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH.mm")
        let data_HHmm = formatter.string(from: now)
        let format = NSLocalizedString("last_updated %@", comment: "")
        return String(format: format, data_HHmm)
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
        let format = NSLocalizedString("feels_like %@", comment: "")
        return String(format: format, "\(Int(weather.main?.feels_like ?? 0))" + suffix)
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
        isLoading = true
        weatherService.getWeather(city: city, unit: settings?.unit.apiParam ?? "metric") { weather in
            if let weather = weather {
                self.weather = weather
            }
            self.isLoading = false
        }
    }

    func fetchBackgroundImage() {
        backgroundImage = ["bg1", "bg2", "bg3", "bg4", "bg5", "bg6"].randomElement()!
    }

    func refreshTime() {
        timeRefresher = 0
    }
}
