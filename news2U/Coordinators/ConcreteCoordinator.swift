//
//  ConcreteCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

public class ConcreteCoordinator: NSObject, Coordinator, UINavigationControllerDelegate  {
    
    // MARK: - Variables
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    /// This method will only be called internally
    public func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    public func childCoordinatorShouldNotBeDeleted(navigationController: UINavigationController) -> Bool {
        guard let fromViewController = navigationController.getFromViewController() else {
            return true
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return true
        }
        return false
    }
    
    open func start() {
        fatalError("start() should be overriden")
    }
    
}

