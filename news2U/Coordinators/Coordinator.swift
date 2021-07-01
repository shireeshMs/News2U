//
//  Coordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//
import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }

    func start()
    func stop()
}

extension Coordinator {
    func addChildCoordinator(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(coordinator: Coordinator) {
        coordinator.stop()

        childCoordinators = childCoordinators.filter({ childCoordinator -> Bool in
            childCoordinator !== coordinator
        })
    }

    func removeAllChildCoordinators() {
        childCoordinators.forEach({ coordinator in
            coordinator.stop()
        })

        childCoordinators.removeAll()
    }
}
