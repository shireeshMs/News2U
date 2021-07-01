//
//  NavCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//


import XCTest

extension XCTestCase {
    func waitForUIKitNavigationAnimation(completion: @escaping () -> Void) {
        let expectation: XCTestExpectation = XCTestExpectation(description: #function)
        let result: XCTWaiter.Result = XCTWaiter.wait(for: [expectation], timeout: 1.5)

        switch result {
        case .completed:
            break

        case .timedOut:
            completion()

        case .incorrectOrder:
            break

        case .invertedFulfillment:
            break

        case .interrupted:
            break
        }
    }
}
