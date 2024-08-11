//
//  SearchView.swift
//  Anytime Weather
//
//  Created by Ilham AM on 05/04/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var showSettings = false
    @State var showMaps = false
    
    @State private var keyword = ""
    
    private var vm = SearchViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView() {
            
            ZStack {
                
                GeometryReader { geo in
                    Image("bg_search")
                        .resizable()
                        .aspectRatio(geo.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
                
                Color.color6.edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                
                VStack {
                    
                    HStack {
                        
                        TextField("enter_city", text: self.$keyword)
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: WeatherDetailView(city: self.keyword)) {
                            Image(systemName: "chevron.forward.circle.fill")
                                .foregroundColor(.white)
                        }.padding()
                        
                    }
                    
                    ForEach(self.vm.getRecommendations(keyword: self.keyword), id: \.self) { keyword in
                        KeywordCell(keyword: keyword)
                    }
                    .cornerRadius(3.0)
                    .listRowBackground(Color.clear)
                    
                    Spacer()
                    
                }
                .padding()
            }
            .navigationBarTitle(Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String)
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
            
        }
        .accentColor(.white)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct KeywordCell: View {
    
    var keyword: Keyword
    
    var body: some View {
        
        NavigationLink(destination: WeatherDetailView(city: keyword.name)) {
            
            VStack(alignment: .center, spacing: 10) {
                
                HStack(alignment: .center) {
                    
                    Image(systemName: self.keyword.isHistory ? "clock" : "magnifyingglass")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15, alignment: .center)
                    
                    Spacer().frame(width: 20)
                    
                    Text(self.keyword.name)
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
