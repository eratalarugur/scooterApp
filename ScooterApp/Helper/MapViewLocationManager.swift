//
//  ObservableLocationManager.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class MapViewLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    static let defaultDistance: CLLocationDistance = 7500
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050),
        latitudinalMeters: MapViewLocationManager.defaultDistance,
        longitudinalMeters: MapViewLocationManager.defaultDistance
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        locationManager.requestWhenInUseAuthorization()
    }
    
    func updateLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: Self.defaultDistance,
                longitudinalMeters: Self.defaultDistance
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("** LOCocation error", error)
    }
    
    func fincClosestVehicle(in list: [VehicleViewModel]) -> VehicleViewModel? {

        if let userLocation = locationManager.location {
            
            var closestIndex = 0
            var closestDistance: CLLocationDistance?
            
            for (index, vehicle) in list.enumerated() {
                let distance = userLocation.distance(from: CLLocation(latitude: vehicle.coordinate.latitude, longitude: vehicle.coordinate.longitude))
               
                if closestDistance == nil {
                    closestDistance = distance
                    closestIndex = index
                }
                
                if let closest = closestDistance, distance < closest {
                    closestDistance = distance
                    closestIndex = index
                }
            }
            
            return list[closestIndex]
        }
        return nil
    }
    
}
