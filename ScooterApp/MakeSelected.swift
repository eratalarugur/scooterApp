//
//  MakeSelected.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 20.02.2022.
//

import SwiftUI

struct MakeSelected: ViewModifier {
    
    var isSelected: Bool
    var color: UIColor
    
    func body(content: Content) -> some View {
        
        ZStack {
            let backgroundShape = Circle()
                .strokeBorder(Color(color), lineWidth: DrawingConstants.cirleLineWidth)
                .frame(width: DrawingConstants.cirleWidth, height: DrawingConstants.circleHeight)
            if isSelected {
                content.background(backgroundShape)
            } else {
                content
            }
        }
    }
    
    private struct DrawingConstants {
        static let cirleWidth: CGFloat = 40
        static let circleHeight: CGFloat = 40
        static let cirleLineWidth: CGFloat = 4
    }
}

extension Text {
    func makeSelected(isSelected: Bool, color: UIColor) -> some View {
        self.modifier(MakeSelected(isSelected: isSelected, color: color))
    }
}
