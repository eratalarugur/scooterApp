//
//  Task.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

typealias Parameters = [String: Any]

enum Task {
    case plain
    case parameters(Parameters)
}
