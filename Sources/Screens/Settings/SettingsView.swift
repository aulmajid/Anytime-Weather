//
//  SettingsView.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: AppSettings
    let units = Unit.all()

    var body: some View {
        ZStack {
            Color.color6.edgesIgnoringSafeArea(.all)

            Form {
                Section(header: Text("select_unit")
                    .foregroundColor(.white)
                    .bold())
                {
                    ForEach(units, id: \.self) { unit in
                        Button(action: {
                            self.settings.unit = unit
                        }, label: {
                            UnitCell(unit: unit, isSelected: unit == self.settings.unit)
                        })
                    }
                }
                .listRowBackground(Color.white)
                .accentColor(.white)
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
                .foregroundColor(.color6)

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .isHidden(!self.isSelected)
                .foregroundColor(.color6)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
