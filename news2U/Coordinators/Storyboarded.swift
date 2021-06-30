//
//  Storyboarded.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

public protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {
    
    public static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
}
