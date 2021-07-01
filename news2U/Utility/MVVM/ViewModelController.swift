//
//  ViewModelController.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

import UIKit

typealias Couple<A, B> = (viewModel: A, controller: B)

protocol ViewModelController: Storyboarded, ViewModelProtocol {
    static func initialize(with viewModel: ViewModelType, from storyboard: UIStoryboard) -> Self
}

extension ViewModelController {
    static func initialize(with viewModel: ViewModelType, from storyboard: UIStoryboard) -> Self {
        let viewController: Self = initialize(from: storyboard)
        viewController.viewModel = viewModel

        return viewController
    }
}

