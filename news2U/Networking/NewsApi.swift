//
//  NewsApi.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

struct NewsApi {
    
    static let ApiKey = "9dadcef2d166412d9b22f719cc549e41"
    
    // another for backup (Not left more)
//    static let ApiKey = "bbd49fe67f2647569ee2186aff82a08a"

    
    static let Page = 1

    static func urlForCategory() -> URL? {
        var urlComponents = NewsApi.baseUrlComponents
        
        urlComponents.path = Path.top.rawValue
        
        let keyQueryItem = NewsApi.keyQueryItem
//        let pageQueryItem = NewsApi.keyQueryItem
        let countryQueryItem = URLQueryItem(name: "country", value: "us")
        
        urlComponents.queryItems = [ keyQueryItem, countryQueryItem ]
        
        return urlComponents.url
    }
    
    static func urlForQuery(_ page: String) -> URL? {
        var urlComponents = NewsApi.baseUrlComponents
        
        urlComponents.path = Path.search.rawValue
        
        let keyQueryItem = NewsApi.keyQueryItem
        let pageQueryItem = URLQueryItem(name: "page", value: page)
//        let languageQueryItem = URLQueryItem(name: "language", value: "en")
        let queryQueryItem = URLQueryItem(name: "q", value: "bitcoin")
        
        urlComponents.queryItems = [ keyQueryItem ,queryQueryItem ,pageQueryItem]
        
        return urlComponents.url
    }
    
}

private extension NewsApi {
    enum Path: String {
        case top = "/v2/top-headlines"
        case search = "/v2/everything"
    }
    
    static var baseUrlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        
        return urlComponents
    }
    
    static var keyQueryItem: URLQueryItem {
        return URLQueryItem(name: "apiKey", value: ApiKey)
    }
    static var pageQueryItem: URLQueryItem {
        return URLQueryItem(name: "page", value: String(Page))
    }
}

extension URL {
    
    func get<T: Codable>(completion: @escaping (Result<T, ApiError>) -> Void) {
        print("get: \(self.absoluteString)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: self) { data, _, error in
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
                return
            }
            
            guard let unwrappedData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decoded = try? decoder.decode(T.self, from: unwrappedData) {
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
            }
        }
        
        task.resume()
    }
    
}

public enum ApiError: Error {
    case generic
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case unknownError           //Status code not known
}
