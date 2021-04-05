//
//  SettingsView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedUnit = "Celcius"
    let units = ["Celcius", "Fahrenheit"]
    
    var body: some View {
        
        Form {
            Section(header: Text(self.selectedUnit)) {
                
                ForEach(units, id: \.self) { unit in
                    
                    UnitCell(unit: unit)
                    
                }
                
            }
        }
    }
    
}

struct UnitCell: View {
    
    var unit: String
    
    var body: some View {
        
        Button(action: {
            
        }) {
            
            HStack {
                
                Text(unit)
                
                Spacer()
                
                Image(systemName: "gearshape")
                
            }
            
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
