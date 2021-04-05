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
        
        VStack {
            
            HStack {
                
                VStack {
                    
                    Image(systemName: "pencil")
                    
                }
                
            }
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.red)
        
    }
    
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(city: "Surabaya")
    }
}
