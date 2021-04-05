//
//  ContentView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView() {
            VStack {
                Text("Hello world")
            }
            .navigationBarTitle("Anytime Weather")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
