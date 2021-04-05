//
//  ContentView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city = ""
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView() {
            
            ZStack {
                
                Color.color6.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        
                        TextField("Enter city", text: self.$city)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: WeatherDetailView(city: self.city)) {
                            Image(systemName: "chevron.forward.circle.fill")
                        }.padding()
                        
                    }
                    .background(Color.white)
                    .cornerRadius(3.0)
                    .padding()
                    
                    ForEach(0...5, id: \.self) { city in
                        let a = "\(city) hahaha"
                        CityCell(city: a)
                    }
                    .cornerRadius(3.0)
                    .listRowBackground(Color.clear)
                    
                    Spacer()
                    
                }
                .navigationBarTitle("Anytime Weather")
            }
        }
        
    }
    
}

struct CityCell: View {
    
    var city: String
    
    var body: some View {
        
        HStack {
            
            Text(self.city)
            
            Spacer()
            
        }
        .background(Color.white)
        .padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
