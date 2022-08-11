//
//  Router.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

protocol Router {
    func makeRequest() throws -> URLRequest
}

//MARK: - Request Mehtods
enum HTTPMethod: String {
    case get = "GET"
}

//MARK: - Request Paramters
typealias Parameters = [String:Any]

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
    case none
}

//MARK: - Endpoints
enum Endpoints: String {
    case movies = "films"
    case movieById = "films/%d"
}


enum ResponseCode: Int {
     
    /**
     * HTTP Status-Code 200: OK.
    */
    case httpOK = 200
    
    
    /**
    * HTTP Status-Code 201: Created.
    */
    case httpCreated = 201

    /**
    * HTTP Status-Code 300: Multiple Choices.
    */
    case httpMultipleChoices = 300

    
    /**
    * HTTP Status-Code 301: Moved Permanently.
    */
    case httpMovedPermanently = 301
    
    
    /**
    * HTTP Status-Code 302: Temporary Redirect.
    */
    case httpTemporaryRedirect = 302
    
    
    /**
    * HTTP Status-Code 303: See Other.
    */
    case httpSeeOther = 303
    
    
    /**
    * HTTP Status-Code 304: Not Modified.
    */
    case httpNotModified = 304
    
    
    /**
    * HTTP Status-Code 305: Use Proxy.
    */
    case httpUseProxy = 305
    
    
    /**
    * HTTP Status-Code 400: Bad Request.
    */
    case httpBadRequest = 400
    
    
    /**
    * HTTP Status-Code 401: Unauthorized.
    */
    case httpUnauthorized = 401

    
    /**
    * HTTP Status-Code 402: Payment Required.
    */
    case httpPaymentRequired = 402
    
    
    /**
    * HTTP Status-Code 403: Forbidden.
    */
    case httpForbidden = 403
    
    
    /**
    * HTTP Status-Code 404: Not Found.
    */
    case httpNotFound = 404
    
    
    /**
    * HTTP Status-Code 405: Method Not Allowed.
    */
    case httpMethodNotAllowed = 405
    
    
    /**
    * HTTP Status-Code 406: Not Acceptable.
    */
    case httpNotAcceptable = 406
    
    
    /**
    * HTTP Status-Code 407: Proxy Authentication Required.
    */
    case httpProxyAuthenticationRequired = 407
    
    /**
    * HTTP Status-Code 408: Request Time-Out.
    */
    case httpRequestTimeOut = 408

    /**
    * HTTP Status-Code 409: Conflict.
    */
    case httpConflict = 409

    /**
    * HTTP Status-Code 410: Gone.
    */
    case  httpGone = 410

    /**
    * HTTP Status-Code 411: Length Required.
    */
    case  httpLengthRequired = 411

    /**
    * HTTP Status-Code 412: Precondition Failed.
    */
    case  httpPreconditionFailed = 412

    /**
    * HTTP Status-Code 413: Request Entity Too Large.
    */
    case  httpRequestEntityTooLarge = 413

    /**
    * HTTP Status-Code 414: Request-URI Too Large.
    */
    case  httpRequestURITooLarge = 414

    /**
    * HTTP Status-Code 415: Unsupported Media Type.
    */
    case  httpUnsupportedMediaType = 415
}
