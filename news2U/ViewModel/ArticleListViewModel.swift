//
//  TVShowViewModel.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit
class ArticleListViewModel : ViewModel {
    var tvShowContainer: Headline? {
        didSet {
            // Update UI
            updateCellViewModels()
            tvShowInteractor.shouldUpdateTableView()
        }
    }
    private let coordinator: AllArticlesListCoordinator

   
    func showDetail() {
//        coordinator.showDetailPage()
    }

    func previewDetail() -> UIViewController? {
        return coordinator.generateDetailCouple().controller
    }

    func commitPreviewContext(viewController: UIViewController) {
        coordinator.commitViewController(viewController)
    }
    var tvShowCellViewModels: [ArticleCellViewModel] = []
    
    private let tvShowInteractor: TVShowInteractor
    
    init( tvShowInteractor: TVShowInteractor, coordinator: AllArticlesListCoordinator) {
        self.tvShowInteractor = tvShowInteractor as! TVShowInteractor
        self.coordinator = coordinator
        fetchTVShows()
    }
    
    func fetchTVShows(shouldApplyPagination: Bool = false) {
        NewsApi.getArticles(url: NewsApi.urlForCategory()) { [weak self] result in
            self?.tvShowContainer = result
            print(self?.tvShowContainer?.articles)
            self?.coordinator.shouldUpdateTableView()
        }

    }
    
    func updateCellViewModels() {
        let tvShows = tvShowContainer?.articles ?? []
        for tvShow in tvShows {
            tvShowCellViewModels.append(ArticleCellViewModel(tvShow: tvShow))
        }
    }
    
}
