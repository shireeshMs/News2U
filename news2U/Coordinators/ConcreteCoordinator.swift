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

    func start() {
        showWelcomePage()
    }

    func showWelcomePage() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let viewModel: WelcomePageViewModel = WelcomePageViewModel(coordinator: self)
        let viewController: WelcomePageController = WelcomePageController.initialize(with: viewModel, from: storyboard)
//        self.navigationController.pushViewController(viewController, animated: true)
        self.navigationController.pushViewController(viewController, animated: false)
    }

    func showTabBarCoordinator(animated: Bool) {
        
        let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController())
        addChildCoordinator(coordinator: coordinator)

        coordinator.start()
        navigationController.pushViewController(coordinator.tabBarController, animated: animated)
//        navigationController.present(coordinator.tabBarController, animated: animated, completion: {
//            self.stop()
//        })
    }
}


