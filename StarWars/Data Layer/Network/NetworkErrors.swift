//
//  NetworkErrors.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

enum NetworkError: Int, Error {
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case internalServerError = 500
    case noResponse = -100
    case networkProblem
    case unknown
    
    init(rawValue: Int) {
        switch rawValue {
        case NSURLErrorNotConnectedToInternet:
            self = .networkProblem
        case Self.forbidden.rawValue:
            self = .forbidden
        case Self.conflict.rawValue:
            self = .conflict
        case Self.internalServerError.rawValue:
            self = .internalServerError
        case Self.notFound.rawValue:
            self = .notFound
        case Self.noResponse.rawValue:
            self = .noResponse
        default:
            self = .unknown
        }
    }
}

enum AppError: Error {
    case weakSelfDeallocated(_ text: String)
    case internalError(_ text: String)
}
