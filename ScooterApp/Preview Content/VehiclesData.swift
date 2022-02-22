//
//  VehiclesData.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 22.02.2022.
//

import Foundation

class VehiclesData {
    
    static func fetchVehicles() -> VehicleResponse {
        guard let path = Bundle.main.path(forResource: "vehicles", ofType: "json") else {
            fatalError("Path for vehicles.json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        guard let vehicleRespnse = try? JSONDecoder().decode(VehicleResponse.self, from: data) else {
            fatalError("Unable to decode data!")
        }
        
        return vehicleRespnse
    }
}
