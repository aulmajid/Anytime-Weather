//
//  WeatherService.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import Alamofire
import Combine

/// @mockable
protocol WeatherServiceProtocol {
    func getWeather(city: String, unit: String, completion: @escaping ((WeatherDTO?) -> Void))
    func getWeatherFuture(city: String, unit: String) -> Future<WeatherDTO, Error>
    @available(iOS 15.0, *)
    func getWeatherAsync(city: String, unit: String) async throws -> WeatherDTO
    @available(iOS 15.0, *)
    func getWeatherAsyncResult(city: String, unit: String) async -> Result<WeatherDTO, Error>
}

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

    func getWeatherFuture(city: String, unit: String) -> Future<WeatherDTO, any Error> {
        return Future { promise in
            AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: WeatherDTO.self) { response in
                debugPrint(response)
                switch response.result {
                case let .success(weather):
                    promise(.success(weather))
                case let .failure(error):
                    debugPrint(error)
                    promise(.failure(error))
                }
            }
        }
    }

    @available(iOS 15.0, *)
    func getWeatherAsync(city: String, unit: String) async throws -> WeatherDTO {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: WeatherDTO.self) { response in
                debugPrint(response)
                switch response.result {
                case let .success(weather):
                    continuation.resume(returning: weather)
                case let .failure(error):
                    debugPrint(error)
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    @available(iOS 15.0, *)
    func getWeatherAsyncResult(city: String, unit: String) async -> Result<WeatherDTO, Error> {
        return await withCheckedContinuation { continuation in
            AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(unit)&appid=\(TokenConstants.openweathermap)").responseDecodable(of: WeatherDTO.self) { response in
                debugPrint(response)
                switch response.result {
                case let .success(weather):
                    continuation.resume(returning: .success(weather))
                case let .failure(error):
                    debugPrint(error)
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}
