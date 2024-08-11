//
//  View.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
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
