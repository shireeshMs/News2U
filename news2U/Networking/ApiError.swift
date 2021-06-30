//
//  ApiError.swift
//  Networking
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
public enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case unknownError           //Status code not known
    case generic
}
