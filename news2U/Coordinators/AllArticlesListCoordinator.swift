//
//  AllArticlesListCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

final class AllArticlesListCoordinator: NavCoordinator ,TVShowInteractor{
   
    func shouldUpdateTableView() {
        let viewController: ArticleListViewController = self.navigationController.topViewController as! ArticleListViewController
        viewController.shouldUpdateTableView()
        
    }
    
    
    let navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
        //        if #available(iOS 11.0, *) {
        //            tabBar.barTintColor = .black
        //            tabBar.tintColor = UIColor(named: "color_theme")
        //        }
        //        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .normal)
        //        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .selected)
        UITabBarItem(title: "Popular", image: UIImage(named: "ic_popular_disabled"), selectedImage: UIImage(named: "ic_popular"))
    }
    func showHome() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let viewModel: ArticleListViewModel = ArticleListViewModel(tvShowInteractor: self, coordinator: self)
        let viewController: ArticleListViewController = ArticleListViewController.initialize(with: viewModel, from: storyboard)
        
        viewController.title = "Article list"
        viewController.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "ic_popular_disabled"), selectedImage: UIImage(named: "ic_popular"))
        navigationController.pushViewController(viewController, animated: true)
        navigationController.configureTheme()
    }
     func start() {
        
        showHome()
    }
    func generateDetailCouple(_ article : ArticleCellViewModel) -> Couple<ArticleDetailViewModel, ArticleDetailController> {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let viewModel: ArticleDetailViewModel = ArticleDetailViewModel(coordinator: self)
        viewModel.tvShowContainer = article
        let viewController: ArticleDetailController = ArticleDetailController.initialize(with: viewModel, from: storyboard)

        return (viewModel: viewModel, controller: viewController)
    }

    func previewDetailPage(for article : ArticleCellViewModel) -> ArticleDetailController {
        return generateDetailCouple(article).controller
    }

    func showDetailPage(for article : ArticleCellViewModel) {
        let couple: Couple<ArticleDetailViewModel, ArticleDetailController> = generateDetailCouple(article)
    
        navigationController.pushViewController(couple.controller, animated: true)
        navigationController.configureTheme()
    }

}

