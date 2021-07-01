//
//  WelcomePageController.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

import UIKit

final class WelcomePageController: UIViewController, ViewModelController {
    typealias ViewModelType = WelcomePageViewModel

    var viewModel: ViewModelType!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction private func startApplicationAction(_: UIButton) {
        viewModel.startApplication()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
