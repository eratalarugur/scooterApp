//
//  VehicleView.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 19.02.2022.
//

import SwiftUI


struct VehicleView: View {
    
    var vehicleViewModel: VehicleViewModel
    
    var body: some View {
        
        let screenWidth = UIScreen.main.bounds.size.width

        VStack() {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(DesignConstants.headerText)
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(DesignConstants.headerTextFontWeight)
                        .padding(DesignConstants.headerPadding)
                    Text(vehicleViewModel.id)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(DesignConstants.vehicleModelFontWeight)
                        .padding(DesignConstants.vehicleModelPadding)
                    
                }.padding(.leading, DesignConstants.headerStateCardPadding)
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("🔋\(vehicleViewModel.battery)")
                        .foregroundColor(.black)
                        .font(.system(size: DesignConstants.batteryTextFontSize))
                        .fontWeight(DesignConstants.batteryTextWeight)
                        .padding(DesignConstants.batteryPadding)
                    Text(vehicleViewModel.vehicle.state)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(DesignConstants.stateTextWeight)
                        .padding(DesignConstants.statePadding)
                }
                
                Spacer()
            }
        }
        .frame(width: screenWidth, height: DesignConstants.cardHeight)
            .background(Color.gray)
            .cornerRadius(DesignConstants.cardCornerRadius, corners: .topLeft)
            .cornerRadius(DesignConstants.cardCornerRadius, corners: .topRight)
            .edgesIgnoringSafeArea(.all)
            
    }
    
    private struct DesignConstants {
        static let headerText = "Scooter 🛴"
        static let cardCornerRadius: CGFloat = 20
        static let statePadding: CGFloat = 2
        static let batteryPadding: CGFloat = 2
        static let batteryTextWeight: Font.Weight = .bold
        static let stateTextWeight: Font.Weight = .bold
        static let cardHeight: CGFloat = 140
        static let batteryTextFontSize: CGFloat = 26
        static let vehicleModelPadding: CGFloat = 2
        static let headerPadding: CGFloat = 2
        static let headerStateCardPadding: CGFloat = 16
        static let headerTextFontWeight: Font.Weight = .bold
        static let vehicleModelFontWeight: Font.Weight = .bold

    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
