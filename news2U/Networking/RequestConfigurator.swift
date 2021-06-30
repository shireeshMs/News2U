//
//  RequestConfigurator.swift
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
    
    // Additional path will be added to source url
    public var path: String?
    
    // The HTTP Method of the request
    // Ex: .get, .post
    public var httpMethod: HTTPMethod?
    
    // MARK: - Initializer
    public init(path: String = "", parameters: Parameters? = [:], httpMethod: HTTPMethod? = .get) {
        self.path = path
        self.parameters = parameters
        self.httpMethod = httpMethod
    }
    
}
