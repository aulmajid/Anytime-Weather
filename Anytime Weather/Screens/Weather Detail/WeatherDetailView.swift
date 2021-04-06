//
//  WeatherDetailView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @State var showSettings = false
    
    @EnvironmentObject var settings: AppSettings
    @ObservedObject var vm = WeatherDetailViewModel()
    @State var isLoading = false
    
    init(city: String) {
        vm.city = city
    }
    
    var body: some View {
        
        ZStack {
            
            Color.color6.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                Text(vm.city)
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
                
                Text(vm.condition)
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
                        
//                        ProgressView(value: 100, total: 100)
//                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
//                            .animation(.none)
                        
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 13, height: 13)
                        
                        Text(vm.lastUpdated)
                            .font(.caption)
                            .foregroundColor(.white)
                        
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
            vm.settings = settings
            vm.fetchWeather()
        })
        .background(NavigationLink(destination: SettingsView(), isActive: $showSettings) {})
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    DownloadUtils.download(url: vm.iconURL, fileName: vm.iconFileName, completion:{_ in })
                }) {
                    Image(systemName: "tray.and.arrow.down")
                }
                Button(action: {
                    showSettings = true
                }) {
                    Image(systemName: "gearshape")
                }
            }
        }
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
