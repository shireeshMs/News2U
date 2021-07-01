//
//  NavCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//


@testable import news2U

import XCTest

final class CoordinatorTests: XCTestCase {
	typealias CoordinatorType = ConcreteCoordinator

	var coordinator: CoordinatorType!

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of
		// each test method in the class.

		coordinator = ConcreteCoordinator(navigationController: UINavigationController())
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of
		// each test method in the class.
		super.tearDown()

		coordinator = nil
	}

	func testCoordinatorCreation() {
		XCTAssertTrue(coordinator.navigationController.viewControllers.isEmpty)
		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testCoordinatorPushViewController() {
		coordinator.showWelcomePage()

		XCTAssertFalse(coordinator.navigationController.viewControllers.isEmpty)
	}

	func testCoordinatorPopViewController() {
		coordinator.showWelcomePage()
		coordinator.showWelcomePage()

		XCTAssertEqual(coordinator.navigationController.viewControllers.count, 2)

		coordinator.popViewController()

		waitForUIKitNavigationAnimation(completion: {
			XCTAssertEqual(self.coordinator.navigationController.viewControllers.count, 1)
			XCTAssertTrue(self.coordinator.navigationController.viewControllers.first is WelcomePageController)
		})
	}

	func testTopViewController() {
		coordinator.showWelcomePage()

		XCTAssertTrue(coordinator.topViewController is WelcomePageController)
	}

	func testAddChildCoordinator() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)
		
		XCTAssertFalse(coordinator.childCoordinators.isEmpty)
	}

	func testRemoveChildCoordinator() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.childCoordinators.count, 1)

		coordinator.removeChildCoordinator(coordinator: childCoordinator)

		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testRemoveAllChildCoordinators() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)
		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.childCoordinators.count, 2)

		coordinator.removeAllChildCoordinators()

		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testCoordinatorStop() {
		coordinator.showWelcomePage()

		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.navigationController.viewControllers.count, 1)

		coordinator.stop()

		XCTAssertTrue(coordinator.navigationController.viewControllers.isEmpty)
		XCTAssertFalse(coordinator.childCoordinators.isEmpty)
	}
}
