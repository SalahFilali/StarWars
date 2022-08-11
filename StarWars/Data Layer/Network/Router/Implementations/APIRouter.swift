//
//  APIRouter.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

enum APIRouter: Router {
    
    case movies
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    // MARK: - Parameters
     var parameters: RequestParams {
         return .none
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .movies:
            return Endpoints.movies.rawValue
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func makeRequest() throws -> URLRequest {
        guard let url = URL(string: AppConfig.shared.baseURL) else {
            throw NSError(domain: "Unable to create URL from String", code: -420, userInfo: nil)
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}

