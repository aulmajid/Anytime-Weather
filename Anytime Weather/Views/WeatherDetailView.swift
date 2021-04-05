//
//  WeatherDetailView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var city: String
    
    var body: some View {
        
        ZStack {
    
            
            Color.clear.edgesIgnoringSafeArea(.all)
        
        VStack(alignment: .center) {
            VStack(alignment: .center) {
                
                Text("Surabaya")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("April 5, 2021")
                    .font(.title)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                
                Text("Clouds")
                
                Text("23°F")
                    .font(.system(size: 130))
                
                Text("Feels like 23°F")
                
                Text("Min :\t\t\t23°F\n" +
                        "Max :\t\t23°F\n" +
                        "Pressure :\t1000\n" +
                        "Humidity :\t55")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
            
            Text("Forecast")
            
        }
        .background(Color.red)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
