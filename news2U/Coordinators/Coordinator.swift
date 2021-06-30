//
//  Coordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//
import Foundation
import UIKit

public protocol Coordinator : AnyObject {
    func start()
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
}
