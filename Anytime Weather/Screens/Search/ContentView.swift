//
//  ContentView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var keyword = ""
    
    var history = ["Surabaya", "Jakarta", "Surakarta", "Bandung", "Semarang", "Yogyakarta", "Medan", "Batam"]
    var searchSuffix = ["baya", "karta", "dung", "rang", "dan", "tam"]
    
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
                    ForEach(isHistory ? self.history : self.searchSuffix, id: \.self) { recommended in
                        KeywordCell(keyword: self.keyword + recommended, isHistory: isHistory)
                    }
                    .cornerRadius(3.0)
                    .listRowBackground(Color.clear)
                    
                    Spacer()
                    
                }
                .navigationBarTitle("Anytime Weather")
                .padding()
            }
        }
        
    }
    
}

struct KeywordCell: View {
    
    var keyword: String
    var isHistory: Bool
    
    var body: some View {
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}