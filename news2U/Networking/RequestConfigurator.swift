//
//  RequestConfigurator.swift
//  Networking
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import Alamofire

public struct RequestConfigurator {
    
    // MARK: - Variables
    
    // Parameters that will be passed into url
    // as query string
    public var parameters: Parameters?
    
//
    // The HTTP Method of the request
    // Ex: .get, .post
    public var httpMethod: HTTPMethod?
    
    // MARK: - Initializer
    public init( parameters: Parameters? = [:], httpMethod: HTTPMethod? = .get) {
        self.parameters = parameters
        self.httpMethod = httpMethod
    }
    
}
