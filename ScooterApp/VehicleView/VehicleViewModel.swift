//
//  VehicleViewModel.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 19.02.2022.
//

import Foundation
import CoreLocation
import UIKit

struct VehicleViewModel: Identifiable, Equatable {
    let vehicle: Vehicle
    
    var id: String {
        vehicle.vehicleId
    }
    
    var battery: Int {
        vehicle.battery
    }
    
    var color: UIColor {
        
        if vehicle.battery < 70 && vehicle.battery >= 40 {
            return UIColor.yellow
        }
        
        if vehicle.battery < 40 {
            return UIColor.red
        }
        
        return UIColor.green
        
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: vehicle.latitude, longitude: vehicle.longitude)
    }
    
    static func ==(lhs: VehicleViewModel, rhs: VehicleViewModel) -> Bool {
        lhs.id == rhs.id
    }

}
