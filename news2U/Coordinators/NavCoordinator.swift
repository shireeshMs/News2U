//
//  NavCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

import UIKit

protocol NavCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}

extension NavCoordinator {
    public func stop() {
        navigationController.setViewControllers([], animated: false)
    }
}

extension NavCoordinator {
    var topViewController: UIViewController? {
        return navigationController.topViewController
    }

    var presentedViewController: UIViewController? {
        return navigationController.presentedViewController
    }

    var visibleViewController: UIViewController? {
        return navigationController.visibleViewController
    }
}

extension NavCoordinator {
    func dismissCoordinator() {
        navigationController.dismiss(animated: true, completion: {
            self.parentCoordinator?.removeChildCoordinator(coordinator: self)
        })
    }
}

extension NavCoordinator {
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

extension NavCoordinator {
    func dismissViewController() {
        navigationController.dismiss(animated: true)
    }
}

extension NavCoordinator {
    private var currentViewController: UIViewController {
        guard let currentViewController: UIViewController = visibleViewController else {
            return navigationController
        }

        return currentViewController
    }

    func present(alertController: UIAlertController) {
        currentViewController.present(alertController, animated: true)
    }

    func present(activityViewController: UIActivityViewController) {
        currentViewController.present(activityViewController, animated: true)
    }
}
