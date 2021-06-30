//
//  ApiRouter.swift
//  Networking
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import Alamofire

public struct ApiRouter: URLRequestConvertible {
    
    private var requestConfigurator: RequestConfigurator
    
    public init(requestConfigurator: RequestConfigurator) {
        self.requestConfigurator = requestConfigurator
    }
    
    //MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: requestConfigurator.parameters!)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        return requestConfigurator.httpMethod!
    }
    
}
