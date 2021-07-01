//
//  ViewModelProtocol.swift
//  news2U
//
//  Created by PiancaSiri on 01/07/21.
//

protocol ViewModel: AnyObject {}

protocol ViewModelProtocol: AnyObject {
    associatedtype ViewModelType: ViewModel

    var viewModel: ViewModelType! { get set }
}
