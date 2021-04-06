//
//  SettingsView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: AppSettings
    let units = Unit.all()
    
    var body: some View {
        
        Form {
            Section(header: Text(settings.unit.name)) {
                
                ForEach(units, id: \.self) { unit in
                    
                    Button(action: {
                        self.settings.unit = unit
                    }) {
                        UnitCell(unit: unit, isSelected: unit == self.settings.unit)
                    }
                    
                }
                
            }
        }
    }
    
}

struct UnitCell: View {
    
    var unit: Unit
    var isSelected: Bool
    
    var body: some View {
            
            HStack {
                
                Text(unit.name)
                
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
