//
//  NavCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

@testable import news2U

import UIKit
import XCTest

extension XCTestCase {
	func replaceAppDelegateCoordinator(with coordinator: TabCoordinator) {
		guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
			fatalError("Unable to retrieve UIApplication's UIApplicationDelegate")
		}

		appDelegate.window?.rootViewController = coordinator.tabBarController
	}

    func replaceAppDelegateCoordinator(with coordinator: NavCoordinator) {
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to retrieve UIApplication's UIApplicationDelegate")
        }

        appDelegate.window?.rootViewController = coordinator.navigationController
    }
}
