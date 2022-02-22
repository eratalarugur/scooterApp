//
//  MapView.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 19.02.2022.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct MapView: View {
        
    @ObservedObject private var mapViewModel: MapViewModel = MapViewModel(with: APIClient.shared)
    @ObservedObject var locationManager = MapViewLocationManager()
    @State private var isOpen: Bool = false

    init() {
        mapViewModel.load()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $locationManager.region,
                    showsUserLocation: true,
                    annotationItems: mapViewModel.vehicles) { vehicle in
                    MapAnnotation(coordinate: vehicle.coordinate) {
                        VStack {
                            Text("🛴").makeSelected(isSelected: true, color: vehicle.color)
                        }.onTapGesture {
                            DispatchQueue.main.async {
                                mapViewModel.selectedVehicle = vehicle
                            }
                        }
                    }
                }.accessibilityIdentifier(DesingConstants.mapAccssibilityElement)
                VStack() {
                    Spacer()
                    HStack {
                        Spacer()
                        LocationButton() {
                            locationManager.updateLocation()
                        }
                        .frame(width: DesingConstants.locationButtonWidth, height: DesingConstants.locationButtonHeight)
                        .labelStyle(.iconOnly)
                        .symbolVariant(.fill)
                        .foregroundColor(.white)
                        
                    }
                    .padding(.bottom, DesingConstants.locationButtonPaddingBottom)
                    .padding(.trailing, DesingConstants.locationButtonPaddingTrailing)
                    
                    if let vehicle = mapViewModel.selectedVehicle {
                        VehicleView(vehicleViewModel: vehicle)
                    }
                }
                .alert(isPresented: $mapViewModel.showingAlert) {
                    Alert(title: Text(DesingConstants.alertTitle),
                          message: Text(DesingConstants.alertDescription),
                          primaryButton: .default(Text(DesingConstants.alertButtonText)) {
                        mapViewModel.load()
                    },
                          secondaryButton: .cancel()
                    )
                }
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
    
    private struct DesingConstants {
        static let locationButtonWidth: CGFloat = 60
        static let locationButtonHeight: CGFloat = 60
        static let locationButtonPaddingBottom: CGFloat = 24
        static let locationButtonPaddingTrailing: CGFloat = 8
        static let alertTitle = "Error"
        static let alertDescription = "Vehicles couldn't be fetched from the server"
        static let alertButtonText = "OK"
        static let mapAccssibilityElement = "vehicleMap"
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
