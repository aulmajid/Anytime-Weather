//
//  WeatherService.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import Alamofire

class WeatherService: WeatherServiceProtocol {
    func getWeather(city: String, unit: String, completion: @escaping ((WeatherDTO?) -> Void)) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: WeatherDTO.self) { response in
            debugPrint(response)
            switch response.result {
            case let .success(weather):
                completion(weather)
            case let .failure(error):
                debugPrint(error)
                completion(nil)
            }
        }
    }
}
