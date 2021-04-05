//
//  ContentView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city = ""
    
    var body: some View {
        
        NavigationView() {
            VStack {
                
                TextField("Enter city", text: self.$city)
                
                List(0...5, id: \.self) { city in
                    Text("\(city)")
                }
                
                Spacer()
                
            }.padding()
            .navigationBarTitle("Anytime Weather")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
