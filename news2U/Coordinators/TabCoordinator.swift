//
//  TabCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

import Foundation
import UIKit

protocol TabCoordinator: Coordinator {
    var tabBarController: UITabBarController { get }
}

extension TabCoordinator {
    func stop() {
        tabBarController.setViewControllers([], animated: false)
    }
}

extension TabCoordinator {
    var selectedViewController: UIViewController? {
        return tabBarController.viewControllers?[tabBarController.selectedIndex]
    }
}

extension TabCoordinator {
    func selectTab<T: Coordinator>(type _: T.Type) {
        guard let index = childCoordinators.firstIndex(where: { coordinator in
            coordinator is T
        }) else {
            return
        }

        tabBarController.selectedIndex = index
    }
}

extension TabCoordinator {
    func present(alertController: UIAlertController) {
        tabBarController.present(alertController, animated: true)
    }

    func present(activityViewController: UIActivityViewController) {
        tabBarController.present(activityViewController, animated: true)
    }
}
