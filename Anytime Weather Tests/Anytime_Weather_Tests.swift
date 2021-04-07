//
//  Anytime_Weather_Tests.swift
//  Anytime Weather Tests
//
//  Created by aku pintar indonesia on 07/04/21.
//

import XCTest

class Anytime_Weather_Tests: XCTestCase {

    func test_SearchRecommendsHistory_InputEmpty() {
        let vm = SearchViewModel()
        let keywords = vm.getRecommendations(keyword: "")
        for keyword in keywords {
            XCTAssertEqual(keyword.isHistory, true)
        }
    }
    
    func test_SearchRecommendsNewKeywords_InputNotEmpty() {
        let vm = SearchViewModel()
        let keywords = vm.getRecommendations(keyword: "Solo")
        for keyword in keywords {
            XCTAssertEqual(keyword.isHistory, false)
        }
    }

}
