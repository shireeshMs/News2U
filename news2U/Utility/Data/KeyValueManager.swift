//
//  KeyValueManager.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

open class KeyValueManager<T: Codable, N: Codable>: DataManager {
    
    // MARK: - Private Variables
    private let dataNotifier: DataNotifier<N>?
    
    // MARK: - Public Variables
    let userDefaults = UserDefaults.standard
    
    // MARK: - Init
    public init(dataNotifier: DataNotifier<N>?) {
        self.dataNotifier = dataNotifier
    }
    
    // MARK: - Functions
    public func save(with key: String, data: T?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
    public func load(with key: String) -> T? {
        if let savedData = userDefaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let codableData = try? decoder.decode(T.self, from: savedData) {
                return codableData
            }
        }
        return nil
    }
    
    public func loadCodableList(with key: String) -> [T]? {
        if let list = userDefaults.object(forKey: key) as? Data {
            let decoder = PropertyListDecoder()
            if let codableList = try? decoder.decode([T]?.self, from: list) {
                return codableList
            }
        }
        return nil
    }
    
    public func updateCodableList(with key: String, data: [T]?) {
        let encoder = PropertyListEncoder()
        if let encoded = try? encoder.encode(data) {
            userDefaults.set(encoded, forKey: key)
        }
    }
    
}
