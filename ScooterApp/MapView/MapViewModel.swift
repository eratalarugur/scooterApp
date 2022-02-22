//
//  MapViewModel.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 19.02.2022.
//

import Foundation
import CoreLocation
import SwiftUI

class MapViewModel: ObservableObject {
    
    @Published private(set) var vehicles: [VehicleViewModel] = [VehicleViewModel]()
    @Published var selectedVehicle: VehicleViewModel?
    @Published var showingAlert = false
    
    private let serviceAPI: NetworkService
    
    init(with api: APIClient) {
        self.serviceAPI = api
    }
    
    func load() {
        fetchVehicles()
    }
    
    private func fetchVehicles() {
        
        self.serviceAPI.request(response: VehicleResponse.self, router: APIRouter.vehicles) { [weak self] result in
            
            switch result {
            case let .success(response):
                print("success respones: ", response)
                DispatchQueue.main.async {
                    self?.vehicles = response.data.current.compactMap(VehicleViewModel.init)
                }
            case let .failure(error):
                print("error: ", error)
                self?.showingAlert = true
            }
        }
    }
}

