//
//  TVShowRepository.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

class NewsRepository: Repository {
    
    
    typealias T = Headline?
    
    private var requestConfigurator: RequestConfigurator
    
    private var dataManager: TVShowDataManager?
    
    private var currentPage: Int = 1 {
        didSet {
            requestConfigurator.parameters = [
                "page" : String(currentPage),
                Constants.Parameters.api_key: Constants.tmdbApiKey]
        }
    }
    
    func incrementPage() {
        currentPage += 1
    }
    
    public init(requestConfigurator: RequestConfigurator, dataManager: TVShowDataManager? = TVShowDataManager(dataNotifier: DataNotifier<Headline>(dataCallback: { (container) in
        
    }, errorCallback: { (error) in
        
    }))) {
        self.dataManager = dataManager
        self.requestConfigurator = requestConfigurator
    }
    
    func getLocalDataSource() -> Headline? {
        return dataManager?.loadAllTVShows()
    }
    
    func getRemoteDataSource(responseCallback: @escaping (Result<Headline?, ApiError>) -> Void) {
        ApiClient.request(ApiRouter(requestConfigurator: requestConfigurator), completion: responseCallback)
    }
    
}
public protocol Repository {
    
    associatedtype T
    
    func getLocalDataSource() -> T
    
    func getRemoteDataSource(responseCallback: @escaping (Result<T, ApiError>) -> Void)
}
