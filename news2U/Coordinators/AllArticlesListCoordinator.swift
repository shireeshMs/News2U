//
//  AllArticlesListCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit
class AllArticlesListCoordinator: ConcreteCoordinator {
    
    override func start() {
        let listingView = ArticleListViewController.instantiate()// 6
        listingView.coordinator = self
        listingView.title = "Article list"
        listingView.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "ic_popular_disabled"), selectedImage: UIImage(named: "ic_popular"))
        navigationController.pushViewController(listingView, animated: true)
        navigationController.configureTheme()
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if childCoordinatorShouldNotBeDeleted(navigationController: navigationController) { return }
    }
}

