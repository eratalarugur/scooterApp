//
//  APIResponse.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

enum APIResponse<T: Decodable> {
    case success(T)
    case failure(APIError)
}
