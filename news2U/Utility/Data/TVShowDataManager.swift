//
//  TVShowDataManager.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

class TVShowDataManager: KeyValueManager<Headline, Headline> {
    
    // MARK: - Initializer
    override init(dataNotifier: DataNotifier<Headline>?) {
        super.init(dataNotifier: dataNotifier)
    }
    
    // MARK: - Public methods
    func loadAllTVShows() ->  Headline? {
        return self.load(with: "tv_shows")
    }
    
    func saveAllTVShows(data: Headline?) {
        self.save(with: "tv_shows", data: data)
    }
    
}
