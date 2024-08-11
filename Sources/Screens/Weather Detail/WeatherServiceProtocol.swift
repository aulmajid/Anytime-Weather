//
//  WeatherServiceProtocol.swift
//  Anytime Weather
//
//  Created by Ilham AM on 07/04/21.
//

import Foundation

protocol WeatherServiceProtocol {
    func getWeather(city: String, unit: String, completion: @escaping ((Weather?) -> ()))
}
