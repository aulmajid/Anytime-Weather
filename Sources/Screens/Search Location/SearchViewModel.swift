//
//  SearchViewModel.swift
//  Anytime Weather
//
//  Created by Ilham AM on 06/04/21.
//

/// @mockable
protocol SearchViewModelProtocol {
    func getRecommendations(keyword: String) -> [Keyword]
}

struct SearchViewModel: SearchViewModelProtocol {
    private let keywordProvider: KeywordProvider.Type

    init(keywordProvider: KeywordProvider.Type = Keyword.self) {
        self.keywordProvider = keywordProvider
    }

    func getRecommendations(keyword: String) -> [Keyword] {
        if keyword.isEmpty {
            return keywordProvider.history()
        } else {
            return keywordProvider.predict().map { Keyword(name: keyword + $0.name, isHistory: $0.isHistory) }
        }
    }
}
