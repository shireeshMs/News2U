//
//  WelcomePageViewModel.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

final class WelcomePageViewModel: ViewModel {
    private let coordinator: ConcreteCoordinator

    init(coordinator: ConcreteCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Coordinator-related

    func startApplication() {
        coordinator.showTabBarCoordinator(animated: true)
    }
}

