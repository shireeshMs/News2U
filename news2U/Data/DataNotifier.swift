//
//  DataNotifier.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

public struct DataNotifier<Data>: DataObserver {
    
    public typealias T = Data
    
    private let dataCallback: (Data?) -> ()
    
    private let errorCallback: (Error) -> ()
    
    public init(dataCallback: @escaping (Data?) -> (), errorCallback: @escaping (Error) -> ()) {
        self.dataCallback = dataCallback
        self.errorCallback = errorCallback
    }
    
    public func onDataChanged(data: Data?) {
        dataCallback(data)
    }
    
    public func onError(error: Error) {
        errorCallback(error)
    }
    
}

public protocol DataObserver {
    
    associatedtype T
    
    func onDataChanged(data: T?)
    
    func onError(error: Error)
    
}
