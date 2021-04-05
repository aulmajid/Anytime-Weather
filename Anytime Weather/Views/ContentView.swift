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
                
                Color.color6.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
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
                    .cornerRadius(4)
                    
                    List(0...5, id: \.self) { city in
                        Text("\(city)")
                    }
                    
                    Spacer()
                    
                }.padding()
                .navigationBarTitle("Anytime Weather")
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
