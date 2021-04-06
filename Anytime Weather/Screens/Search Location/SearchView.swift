//
//  SearchView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var showSettings = false
    @State var showMaps = false
    
    @State private var keyword = ""
    
    private var vm = SearchViewModel()
    
    var history = ["Surabaya", "Jakarta", "Surakarta", "Bandung", "Auckland", "Tokyo", "London"]
    var searchSuffix = ["", "baya", "karta", "dung", "rang", "dan"]
    
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
                        
                        TextField("Enter city", text: self.$keyword)
                            .foregroundColor(.color6)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: WeatherDetailView(city: self.keyword)) {
                            Image(systemName: "chevron.forward.circle.fill")
                                .foregroundColor(.color6)
                        }.padding()
                        
                    }
                    .background(Color.white)
                    .cornerRadius(3.0)
                    
                    let isHistory = self.keyword.isEmpty
                    ForEach(self.vm.getRecommendations(keyword: self.keyword), id: \.self) { keyword in
                        KeywordCell(keyword: keyword.name, isHistory: isHistory)
                    }
                    .cornerRadius(3.0)
                    .listRowBackground(Color.clear)
                    
                    Spacer()
                    
                }
                .padding()
            }
            .navigationBarTitle("Anytime Weather")
            .background(NavigationLink(destination: SettingsView(), isActive: $showSettings) {})
            .background(NavigationLink(destination: MapsView(), isActive: $showMaps) {})
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showMaps = true
                    }) {
                        Image(systemName: "map")
                    }
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            
        }.accentColor(.white)
        
    }
    
}

struct KeywordCell: View {
    
    var keyword: String
    var isHistory: Bool
    
    var body: some View {
        
        NavigationLink(destination: WeatherDetailView(city: keyword)) {
            
            VStack(alignment: .center, spacing: 10) {
                
                HStack(alignment: .center) {
                    
                    Image(systemName: self.isHistory ? "clock" : "magnifyingglass")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15, alignment: .center)
                    
                    Spacer().frame(width: 20)
                    
                    Text(self.keyword)
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(height: 15)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.up.backward")
                        .foregroundColor(.white)
                    
                }
                
                Color.white.frame(height: 1)
                
            }.padding()
            
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}