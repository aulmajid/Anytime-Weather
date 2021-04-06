//
//  SearchRecommendation.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 06/04/21.
//

import Foundation

struct SearchRecommendation {
    var name: String
    var isHistory: Bool
}

extension SearchRecommendation {
    
    static func history() -> [SearchRecommendation] {
        let a = SearchRecommendation(name: "Surabaya", isHistory: true)
        let b = SearchRecommendation(name: "Jakarta", isHistory: true)
        let c = SearchRecommendation(name: "Surakarta", isHistory: true)
        let d = SearchRecommendation(name: "Bandung", isHistory: true)
        let e = SearchRecommendation(name: "Auckland", isHistory: true)
        let f = SearchRecommendation(name: "Tokyo", isHistory: true)
        let g = SearchRecommendation(name: "London", isHistory: true)
        return [a, b, c, d, e, f, g]
    }
    
    static func predict() -> [SearchRecommendation] {
        let a = SearchRecommendation(name: "", isHistory: false)
        let b = SearchRecommendation(name: "baya", isHistory: false)
        let c = SearchRecommendation(name: "karta", isHistory: false)
        let d = SearchRecommendation(name: "dung", isHistory: false)
        let e = SearchRecommendation(name: "rang", isHistory: false)
        let f = SearchRecommendation(name: "dan", isHistory: false)
        let g = SearchRecommendation(name: "land", isHistory: false)
        return [a, b, c, d, e, f, g]
    }
    
}
