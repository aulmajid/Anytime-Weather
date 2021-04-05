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
                    
                    Button(action: {
                        self.selectedUnit = unit
                    }) {
                        UnitCell(unit: unit, isSelected: unit == self.selectedUnit)
                    }
                    
                }
                
            }
        }
    }
    
}

struct UnitCell: View {
    
    var unit: String
    var isSelected: Bool
    
    var body: some View {
            
            HStack {
                
                Text(unit)
                
                Spacer()
                
                Image(systemName: "gearshape")
                    .isHidden(!self.isSelected)
                
            }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
