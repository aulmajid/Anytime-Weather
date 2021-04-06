//
//  WeatherDetailView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI
import Kingfisher
import AlertToast

struct WeatherDetailView: View {
    
    @State private var showSettings = false
    @State private var showToast = false
    @State private var showForecast = false
    
    @EnvironmentObject private var settings: AppSettings
    @ObservedObject private var vm = WeatherDetailViewModel()
    
    init(city: String) {
        vm.city = city
    }
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { geo in
                    Image("bg1")
                        .resizable()
                        .aspectRatio(geo.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
            }
            
            Color.color6.edgesIgnoringSafeArea(.all)
                .opacity(0.7)
            
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
                
                KFImage.url(URL(string: vm.iconURL))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.white)
                
                Text(vm.condition)
                    .foregroundColor(.white)
                    .italic()
                
                Text(vm.temp)
                    .font(.system(size: 110))
                    .foregroundColor(.white)
                    .bold()
                
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
                
                Button(action: {
                    self.showForecast.toggle()
                }) {
                    Text("Show more forecast")
                        .foregroundColor(.color6)
                }.sheet(isPresented: self.$showForecast) {
                    ForecastView()
                }
                .frame(width: 200, height: 36)
                .background(Color.white)
                .cornerRadius(18.0)
                
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
                    if let url = URL(string: vm.iconURL) {
                        KingfisherManager.shared.retrieveImage(with: url) { result in
                            switch result {
                            case .success(let value):
                                debugPrint(value)
                                UIImageWriteToSavedPhotosAlbum(value.image, nil, nil, nil)
                                self.showToast.toggle()
                            case .failure(let error):
                                debugPrint(error)
                            }
                        }
                    }
                }) {
                    Image(systemName: "tray.and.arrow.down")
                }
                Button(action: {
                    showSettings = true
                }) {
                    Image(systemName: "arrow.down.doc")
                }
                Button(action: {
                    showSettings = true
                }) {
                    Image(systemName: "gearshape")
                }
            }
        }.toast(isPresenting: $showToast, duration: 2){
            AlertToast(type: .complete(.color6), title: "Image Saved!")
        }
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
