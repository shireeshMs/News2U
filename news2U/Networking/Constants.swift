//
//  Constants.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

public struct Constants {
    
    /// The API's base URL
    public static let baseUrl = "https://newsapi.org/v2/top-headlines"
    
    /// Paste your API Key over here
    public static let tmdbApiKey = "c965383ea2634bcbbcf91389753f343e"
    
    /// The parameters (Queries) that we're gonna use
    public struct Parameters {
        public static let api_key = "api_key"
    }
    
    /// The header fields
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    /// The content type (JSON)
    public enum ContentType: String {
        case json = "application/json"
    }
    
}
