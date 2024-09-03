//
//  TestCustomShape.swift
//  Smart Monitoring
//
//  Created by Smart Solar Nepal on 03/09/2024.
//

import SwiftUI

struct MessageBubble: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius: CGFloat = 33 // Approximated from the image
        let triangleWidth: CGFloat = 15 // Approximated from the image
        let triangleHeight: CGFloat = 15 // Approximated from the image

        var path = Path()

        // Start from the top-left corner (after the triangle)
        path.move(to: CGPoint(x: triangleWidth, y: 100))

        // Draw the triangle
        path.addLine(to: CGPoint(x: 0, y: triangleHeight))
        path.addLine(to: CGPoint(x: triangleWidth, y: triangleHeight))

        // Continue with the rounded rectangle
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)

        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: rect.height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)

        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
        path.addArc(center: CGPoint(x: cornerRadius, y: rect.height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: triangleHeight))

        return path
    }
}

struct TestCustomShape: View {
    var body: some View {
        MessageBubble()
//            .fill(Color.blue)
            .frame(width: 388, height: 90)
    }
}
#Preview {
    TestCustomShape()
}
