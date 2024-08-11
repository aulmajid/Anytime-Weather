//
//  ForecastView.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
//

import SwiftUI

struct ForecastView: View {
    
    @State private var selectedIndex = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.color6.cgColor!)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.color6.cgColor!)], for: .normal)
    }
    
    var body: some View {
        
        ZStack {
            
            Color.color1.edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center) {
                
                Spacer()
                    .frame(height: 30)
                
                Picker("Tab", selection: $selectedIndex, content: {
                    Text("forecast_tab_week").tag(0)
                    Text("forecast_tab_15_days").tag(1)
                    Text("forecast_tab_month").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                
                Text("coming_soon")
                    .font(.system(size: 50))
                    .foregroundColor(.color6)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
            }.padding()
            
        }
        
    }
    
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
