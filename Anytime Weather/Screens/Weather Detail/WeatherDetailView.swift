//
//  WeatherDetailView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @ObservedObject var vm = WeatherDetailViewModel()
    
    init(city: String) {
        vm.city = city
    }
    
    var body: some View {
        
        ZStack {
            
            Color.color6.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                Text("Surabaya")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("April 5, 2021")
                    .font(.title)
                    .foregroundColor(.white)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.white)
                
                Text("Clouds")
                    .foregroundColor(.white)
                
                Text("\(self.vm.weather.main?.temp ?? 0)")
                    .font(.system(size: 130))
                    .foregroundColor(.white)
                
                Text("Feels like 23°F")
                    .foregroundColor(.white)
                
                Text("Min :\t\t\t23°F\n" +
                        "Max :\t\t23°F\n" +
                        "Pressure :\t1000\n" +
                        "Humidity :\t55")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Text("Forecast")
                    .foregroundColor(.white)
                    .padding()
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {
            vm.fetchWeather()
        })
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
