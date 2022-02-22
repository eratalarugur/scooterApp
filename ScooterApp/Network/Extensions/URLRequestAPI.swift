//
//  URLRequestAPI.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

extension URLRequest {
    
    init(router: Routable) {
        let urlComponents = URLComponents(router: router)
        self.init(url: urlComponents.url!)
        
        httpMethod = router.method.rawValue
        router.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        guard
            case let .parameters(parameters) = router.task,
            router.parametersEncoding == .json
        else {
            return
        }
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
    
}
