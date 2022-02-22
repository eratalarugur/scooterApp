//
//  Routable.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

typealias Headers = [String: String]

protocol Routable {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
