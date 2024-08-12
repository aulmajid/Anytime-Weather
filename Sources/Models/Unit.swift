//
//  Unit.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
//

import Foundation

struct Unit: Hashable {
    var name: String
    var suffix: String
    var apiParam: String
}

extension Unit {
    static var celcius = Unit(name: "Celcius", suffix: "°C", apiParam: "metric")
    static var fahrenheit = Unit(name: "Fahrenheit", suffix: "°F", apiParam: "imperial")

    static func all() -> [Unit] {
        return [celcius, fahrenheit]
    }
}
