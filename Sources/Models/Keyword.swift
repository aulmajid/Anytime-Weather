//
//  Keyword.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
//

import Foundation

struct Keyword: Hashable {
    var name: String
    var isHistory: Bool
}

extension Keyword {
    static func history() -> [Keyword] {
        let a = Keyword(name: "Surabaya", isHistory: true)
        let b = Keyword(name: "Jakarta", isHistory: true)
        let c = Keyword(name: "Surakarta", isHistory: true)
        let d = Keyword(name: "Bandung", isHistory: true)
        let e = Keyword(name: "Auckland", isHistory: true)
        let f = Keyword(name: "Tokyo", isHistory: true)
        let g = Keyword(name: "London", isHistory: true)
        return [a, b, c, d, e, f, g]
    }

    static func predict() -> [Keyword] {
        let a = Keyword(name: "", isHistory: false)
        let b = Keyword(name: "baya", isHistory: false)
        let c = Keyword(name: "karta", isHistory: false)
        let d = Keyword(name: "dung", isHistory: false)
        let e = Keyword(name: "rang", isHistory: false)
        let f = Keyword(name: "dan", isHistory: false)
        let g = Keyword(name: "land", isHistory: false)
        return [a, b, c, d, e, f, g]
    }
}
