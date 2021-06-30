//
//  EndpointProvider.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

public protocol EndpointProvider {
    
    func provideUrl() -> String
    
}
