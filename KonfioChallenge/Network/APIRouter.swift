//
//  APIRouter.swift
//
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {

    case getDogs
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getDogs:
            return .get
        }
    }
    
        // MARK: - Path
    private var path: String {
            switch self {
            case .getDogs:
                return "kp2e8"
            }
        }
        
        // MARK: - Parameters
    private var parameters: Parameters? {
            switch self {
            case .getDogs:
                return [:]
            }
        }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try K.Server.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Parameters
        if let parameters = parameters {
            
            switch HTTPMethod.get.rawValue {
            case "GET":
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case "POST":
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            default:
                break
            }

        }
        
        return urlRequest
    }
    
}

