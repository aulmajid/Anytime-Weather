//
//  WeatherDetailView.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import AlertToast
import Kingfisher
import SwiftUI

struct WeatherDetailView: View {
    let timer = Timer.publish(
        every: 1, // second
        on: .main,
        in: .common
    ).autoconnect()

    @State private var showSettings = false
    @State private var showToast = false
    @State private var showForecast = false

    @EnvironmentObject private var settings: AppSettings
    @ObservedObject private var vm = WeatherDetailViewModel(weatherService: WeatherService())

    init(city: String) {
        vm.city = city
    }

    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(vm.backgroundImage)
                    .resizable()
                    .aspectRatio(geo.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }

            Color.color6.edgesIgnoringSafeArea(.all)
                .opacity(0.6)

            VStack(alignment: .center) {
                Group {
                    Text(vm.city)
                        .font(.title)
                        .foregroundColor(.white)

                    Text(vm.time)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            vm.refreshTime()
                        }

                    Text(vm.date)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)

//                    KFImage.url(URL(string: vm.iconURL))
//                        .loadDiskFileSynchronously()
//                        .cacheMemoryOnly()
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 100)
//                        .foregroundColor(.white)

                    Image(uiImage: vm.iconURL.toImage())
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

                    Text("additional_info \(vm.minTemp) \(vm.maxTemp) \(vm.pressure) \(vm.humidity)")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding()

                    Button(action: {
                        vm.fetchWeather()
                    }) {
                        HStack {
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
                }

                Spacer()

                Button(action: {
                    self.showForecast.toggle()
                }) {
                    Text("forecast_show_more")
                        .foregroundColor(.color6)
                }.sheet(isPresented: self.$showForecast) {
                    ForecastView()
                }
                .frame(width: 200, height: 36)
                .background(Color.white)
                .cornerRadius(18.0)

            }.isHidden(vm.isLoading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: {
            vm.settings = settings
            vm.fetchWeather()
            vm.fetchBackgroundImage()
        })
        .onDisappear(perform: {
            vm.backgroundImage = ""
        })
        .background(NavigationLink(destination: SettingsView(), isActive: $showSettings) {})
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    if let url = URL(string: vm.iconURL) {
                        KingfisherManager.shared.retrieveImage(with: url) { result in
                            switch result {
                            case let .success(value):
                                debugPrint(value)
                                UIImageWriteToSavedPhotosAlbum(value.image, nil, nil, nil)
                                self.showToast.toggle()
                            case let .failure(error):
                                debugPrint(error)
                            }
                        }
                    }
                }) {
                    Image(systemName: "tray.and.arrow.down")
                }
                Button(action: {
                    if let image = UIImage(named: vm.backgroundImage) {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        self.showToast.toggle()
                    }
                }) {
                    Image(systemName: "arrow.down.doc")
                }
                Button(action: {
                    showSettings = true
                }) {
                    Image(systemName: "gearshape")
                }
            }
        }.toast(isPresenting: $showToast, duration: 2) {
            AlertToast(type: .complete(.color6), title: "Image Saved!")
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
