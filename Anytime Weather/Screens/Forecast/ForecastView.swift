//
//  ForecastView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
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
            
            VStack (alignment: .leading) {
                
                Spacer()
                    .frame(height: 30)
                
                Picker("Tab", selection: $selectedIndex, content: {
                    Text("Weekend").tag(0)
                    Text("15 days").tag(1)
                    Text("Month").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                
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
