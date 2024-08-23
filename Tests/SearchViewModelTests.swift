//
//  SearchViewModelTests.swift
//  AnytimeWeatherTests
//
//  Created by iam on 12/08/24.
//

@testable import AnytimeWeather
import XCTest

class SearchViewModelTests: XCTestCase {
    var viewModel: SearchViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testGetRecommendationsWithEmptyKeyword() {
        let recommendations = viewModel.getRecommendations(keyword: "")
        XCTAssertEqual(recommendations, Keyword.history(), "Empty keyword should return history")
    }

    func testGetRecommendationsWithNonEmptyKeyword() {
        let keyword = "New"
        let recommendations = viewModel.getRecommendations(keyword: keyword)

        XCTAssertFalse(recommendations.isEmpty, "Recommendations should not be empty")

        for recommendation in recommendations {
            XCTAssertTrue(recommendation.name.hasPrefix(keyword), "Each recommendation should start with the keyword")
            XCTAssertFalse(recommendation.isHistory, "Predictions should not be marked as history")
        }
    }
}
