//
//  VehicleResponse.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

struct VehicleResponse: Decodable {
    let data: VehiclesCurrent
}

struct VehiclesCurrent: Decodable {
    let current: [Vehicle]
}
