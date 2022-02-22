//
//  MockNetwork.swift
//  ScooterAppUnitTests
//
//  Created by Eratalar, Ali Ugur (401) on 22.02.2022.
//

import Foundation
@testable import ScooterApp

class MockNetwork {
    
    typealias VehicleResponseResult = ((APIResponse<VehicleResponse>) -> Void)
    
    func getAllVehiclesWithSuccessResult(completion: @escaping VehicleResponseResult) {
        let vehiclesResponse = VehiclesData.fetchVehicles()
        completion(.success(vehiclesResponse))
    }
    
    func getAllVehiclesWithFailure(completion: @escaping VehicleResponseResult) {
        completion(.failure(APIError.noJSONData))
    }
}
