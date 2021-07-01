//
//  Storyboarded.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit


protocol Storyboarded: AnyObject {
    static func initialize(from storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func initialize(from storyboard: UIStoryboard) -> Self {
        let nameSpaceClassName: String = NSStringFromClass(self)

        guard let className: String = nameSpaceClassName.components(separatedBy: ".").last else {
            fatalError("Cannot find class name from: " + nameSpaceClassName)
        }

        guard let viewController: Self = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Cannot find UIViewController with identifier: " + className)
        }

        return viewController
    }
}
