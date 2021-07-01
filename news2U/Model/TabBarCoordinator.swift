//
//  TabBarCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

import UIKit

final class TabBarCoordinator: TabCoordinator {
    let tabBarController: UITabBarController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        childCoordinators = []
    }

    func start() {
        let coordinators: [NavCoordinator] = generateTabCoordinators()

        coordinators.forEach({ coordinator in
            coordinator.parentCoordinator = self
            coordinator.start()
            addChildCoordinator(coordinator: coordinator)
        })

        let navigationControllers: [UINavigationController] = coordinators.map({ coordinator -> UINavigationController in
            coordinator.navigationController
        })

        tabBarController.setViewControllers(navigationControllers, animated: false)

        selectTab(type: AllArticlesListCoordinator.self)
    }

    private func generateTabCoordinators() -> [NavCoordinator] {
        let menuCoordinator: AllArticlesListCoordinator = AllArticlesListCoordinator(navigationController: UINavigationController())
//        let homeCoordinator: HomeCoordinator = HomeCoordinator(navigationController: UINavigationController())
//        let settingsCoordinator: SettingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

        return [menuCoordinator]
    }
}
