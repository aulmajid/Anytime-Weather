//
//  SearchViewModel.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import SwiftUI

class SearchViewModel {
    
    func getRecommendations(keyword: String) -> [Keyword] {
        if keyword.isEmpty {
            return Keyword.history()
        } else {
            return Keyword.predict().map { Keyword(name: keyword + $0.name, isHistory: $0.isHistory) }
        }
    }
    
}
