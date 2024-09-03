//
//  CustomRoundedCorner.swift
//  Smart Monitoring
//
//  Created by Smart Solar Nepal on 02/09/2024.
//

import SwiftUI

struct CustomRoundedCorner: Shape {
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
}


extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomRoundedCorner(radius: radius, corners: corners))
    }
}
