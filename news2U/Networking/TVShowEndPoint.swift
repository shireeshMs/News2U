//
//  TVShowEndPoint.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

/// Models the TVShowEndPoint
public enum TVShowEndPoint : EndpointProvider {
    
    // Gathers popular tv shows weekly or daily
    case trendingTvShows(timeWindow: String)
    case image(width: String, posterPath: String)
    
    // MARK: - EndPointProvider conforming methods
    
    public func provideUrl() -> String {
        
        return ""
    }
    
    // MARK: - Private methods
    
    private func parameters(for page: Int) -> [String : String] {
        return [
            "page" : String(page)
        ]
    }
}
