//
//  SearchViewModelSpec.swift
//  AnytimeWeatherTests
//
//  Created by iam on 12/08/24.
//

@testable import AnytimeWeather
import Nimble
import Quick

class SearchViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: SearchViewModelProtocol!

        beforeEach {
            // Reset handlers before each test
            KeywordProviderMock.historyCallCount = 0
            KeywordProviderMock.predictCallCount = 0
            viewModel = SearchViewModel(keywordProvider: KeywordProviderMock.self)
        }

        describe("getRecommendations") {
            context("when the keyword is empty") {
                it("should return history keywords") {
                    let historyKeywords = [Keyword(name: "History1", isHistory: true), Keyword(name: "History2", isHistory: true)]
                    KeywordProviderMock.historyHandler = { historyKeywords }

                    let recommendations = viewModel.getRecommendations(keyword: "")

                    expect(recommendations).to(equal(historyKeywords))
                    expect(KeywordProviderMock.historyCallCount).to(equal(1))
                    expect(KeywordProviderMock.predictCallCount).to(equal(0))
                }
            }

            context("when the keyword is not empty") {
                let keyword = "New"
                var recommendations: [Keyword]!

                beforeEach {
                    let predictedKeywords = [Keyword(name: "York", isHistory: false), Keyword(name: "Jersey", isHistory: false)]
                    KeywordProviderMock.predictHandler = { predictedKeywords }

                    recommendations = viewModel.getRecommendations(keyword: keyword)
                }

                it("should return non-empty recommendations") {
                    expect(recommendations).notTo(beEmpty())
                    expect(KeywordProviderMock.predictCallCount).to(equal(1))
                    expect(KeywordProviderMock.historyCallCount).to(equal(0))
                }

                it("should have recommendations starting with the keyword") {
                    for recommendation in recommendations {
                        expect(recommendation.name).to(beginWith(keyword))
                    }
                }

                it("should not mark recommendations as history") {
                    for recommendation in recommendations {
                        expect(recommendation.isHistory).to(beFalse())
                    }
                }
            }
        }
    }
}
