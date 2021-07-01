//
//  ConcreteCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

class ConcreteCoordinator: NSObject, NavCoordinator  {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
        
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    // Adding welcome page method
    func start() {
        showWelcomePage()
    }
    
    // Implementation welcome page method
    func showWelcomePage() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewModel: WelcomePageViewModel = WelcomePageViewModel(coordinator: self)
        let viewController: WelcomePageController = WelcomePageController.initialize(with: viewModel, from: storyboard)
        self.navigationController.pushViewController(viewController, animated: false)
    }
    // Implementation Tab for WHole Project 
    func showTabBarCoordinator(animated: Bool) {
        
        let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController())
        addChildCoordinator(coordinator: coordinator)
        coordinator.start()
        if #available(iOS 11.0, *) {
            coordinator.tabBarController.tabBar.barTintColor = .black
            coordinator.tabBarController.tabBar.tintColor = UIColor(named: "color_theme")
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .selected)
        navigationController.pushViewController(coordinator.tabBarController, animated: animated)
    }
}


