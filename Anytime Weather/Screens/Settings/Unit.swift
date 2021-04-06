//
//  Unit.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import Foundation

struct Unit {
    var name: String
    var suffix: String
    var apiParam: String
}

extension Unit {
    
    static func all() -> [Unit] {
        var units = [Unit]()
        units.append(Unit(name: "Celcius", suffix: "°C", apiParam: "metric"))
        units.append(Unit(name: "Fahrenheit", suffix: "°F", apiParam: "imperial"))
        return units
    }
    
}
