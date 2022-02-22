//
//  APIRouter.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

enum APIRouter {
    case vehicles
}

extension APIRouter: Routable {
    
    var baseURL: URL {
        let url = Constants.Network.baseURL
        return URL(string: url)!
    }
    
    var path: String {
        switch self {
        case .vehicles:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .vehicles:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .vehicles:
            return .plain
        }
    }
    
    var headers: Headers? {
        switch self {
        case .vehicles:
            return [
                "Content-Type": "application/json",
                "secret-key": Constants.Network.secretKey
            ]
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .vehicles:
            return .url
        }
    }
}
