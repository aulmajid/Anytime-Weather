//
//  SearchViewModelSpec.swift
//  AnytimeWeatherTests
//
//  Created by iam on 12/08/24.
//

import Quick
import Nimble
@testable import AnytimeWeather

class SearchViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: SearchViewModel!
        
        beforeEach {
            viewModel = SearchViewModel()
        }
        
        describe("getRecommendations") {
            context("when the keyword is empty") {
                it("should return history keywords") {
                    let recommendations = viewModel.getRecommendations(keyword: "")
                    expect(recommendations).to(equal(Keyword.history()))
                }
            }
            
            context("when the keyword is not empty") {
                let keyword = "New"
                var recommendations: [Keyword]!
                
                beforeEach {
                    recommendations = viewModel.getRecommendations(keyword: keyword)
                }
                
                it("should return non-empty recommendations") {
                    expect(recommendations).notTo(beEmpty())
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
