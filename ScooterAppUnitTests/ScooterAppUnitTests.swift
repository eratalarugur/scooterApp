//
//  ScooterAppUnitTests.swift
//  ScooterAppUnitTests
//
//  Created by Eratalar, Ali Ugur (401) on 22.02.2022.
//

import XCTest
@testable import ScooterApp

class ScooterAppUnitTests: XCTestCase {

    func getVehicleViewModels() -> [VehicleViewModel] {
        let vehiclesResponse = VehiclesData.fetchVehicles()
        let vehicles = vehiclesResponse.data.current.compactMap(VehicleViewModel.init)
        return vehicles
    }
    
    func test_vehicles_fetched_from_API_successfully() {
        let vehicles = getVehicleViewModels()
        XCTAssertEqual(vehicles.count, 3)
    }
    
    func test_vehicle_battery_status_color_green() {
        let vehicles = getVehicleViewModels()
        let vehicle1 = vehicles[0]
        XCTAssertEqual(vehicle1.color, UIColor.green)
    }
    
    func test_vehicle_battery_status_color_red() {
        let vehicles = getVehicleViewModels()
        let vehicle1 = vehicles[1]
        XCTAssertEqual(vehicle1.color, UIColor.red)
    }
    
    func test_vehicle_battery_status_color_yellow() {
        let vehicles = getVehicleViewModels()
        let vehicle1 = vehicles[2]
        XCTAssertEqual(vehicle1.color, UIColor.yellow)
    }
    
    
}
