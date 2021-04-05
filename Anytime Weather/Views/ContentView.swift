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
                
                HStack {
                    
                    TextField("Enter city", text: self.$city)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: WeatherDetailView(city: self.city)) {
                        Image(systemName: "chevron.forward.circle.fill")
                    }.padding()
                    
                }.background(Color.green)
                
                List(0...5, id: \.self) { city in
                    Text("\(city)")
                }
                
                Spacer()
                
            }.padding()
            .background(Color.red)
            .navigationBarTitle("Anytime Weather")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
