//
//  DataManager.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

public protocol DataManager {
    
    associatedtype T
    
    func save(with key: String, data: T?)
    
    func load(with key: String) -> T?
    
}
