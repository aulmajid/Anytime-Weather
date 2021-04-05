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
                
                Text(vm.date)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.white)
                
                Text("Clouds")
                    .foregroundColor(.white)
                
                Text(vm.temp)
                    .font(.system(size: 110))
                    .foregroundColor(.white)
                
                Text(vm.feelsLike)
                    .foregroundColor(.white)
                
                Text("Min :\t\t\t\(vm.minTemp)\n" +
                        "Max :\t\t\(vm.maxTemp)\n" +
                        "Pressure :\t\(vm.pressure)\n" +
                        "Humidity :\t\(vm.humidity)")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                  vm.fetchWeather()
                }) {
                    HStack {
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        
                        Text(vm.lastUpdated)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                }
                
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
