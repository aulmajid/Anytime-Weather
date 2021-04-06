//
//  WeatherService.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import Alamofire

class WeatherService {
    
    func getWeather(city: String, unit: String, completion: @escaping ((Weather?) -> ())) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: Weather.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                debugPrint(error)
                completion(nil)
            }
        }
    }
    
}
