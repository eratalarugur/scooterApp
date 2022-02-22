//
//  APIError.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

enum APIError {
    case unknown
    case noJSONData
    case decodingError(Error)
}
