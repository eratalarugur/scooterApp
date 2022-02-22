//
//  Vehicle.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 19.02.2022.
//

import Foundation

struct Vehicle: Decodable {
    let id: String
    let vehicleId: String
    let hardwareId: String
    let zoneId: String
    let battery: Int
    let state: String
    let latitude: Double
    let longitude: Double
}
