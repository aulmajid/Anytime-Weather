//
//  View.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import SwiftUI

extension View {
    
    @ViewBuilder func isHidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
    
}
