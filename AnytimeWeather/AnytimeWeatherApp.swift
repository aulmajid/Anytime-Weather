//
//  AnytimeWeatherApp.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

@main
struct AnytimeWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView()
                .preferredColorScheme(.dark)
                .environmentObject(AppSettings())
        }
    }
}
