//
//  AnytimeWeatherApp.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
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
