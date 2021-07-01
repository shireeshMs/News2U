//
//  TVShowViewModel.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

class ArticleListViewModel {
    
    var tvShowContainer: Headline? {
        didSet {
            // Update UI
            updateCellViewModels()
            tvShowInteractor.shouldUpdateTableView()
        }
    }
    
    var tvShowCellViewModels: [ArticleCellViewModel] = []
    
    private let tvShowRepository: NewsRepository
    private let tvShowInteractor: TVShowInteractor
    
    init(tvShowRepository: NewsRepository = NewsRepository(requestConfigurator: RequestConfigurator( parameters: [Constants.Parameters.api_key : Constants.tmdbApiKey])), tvShowInteractor: TVShowInteractor) {
        self.tvShowRepository = tvShowRepository
        self.tvShowInteractor = tvShowInteractor
        fetchTVShows()
    }
    
    func fetchTVShows(shouldApplyPagination: Bool = false) {
        NewsApi.getArticles(url: NewsApi.urlForCategory()) { [weak self] result in
            self?.tvShowContainer = result
            print(self?.tvShowContainer?.articles)
        }

    }
    
    func updateCellViewModels() {
        let tvShows = tvShowContainer?.articles ?? []
        for tvShow in tvShows {
            tvShowCellViewModels.append(ArticleCellViewModel(tvShow: tvShow))
        }
    }
    
}
