//
//  AppColor.swift
//  Smart Local Monitoring
//
//  Created by Deepam Dhakal on 16/07/2024.
//

import SwiftUI

struct AppColor {
    static let accentBlue = Color(hex: "#0994BB")
    static let tabbarBackground = Color(hex: "#EDEDED")
    static let background = Color(hex: "#FCFEFF")
    static let green = Color(hex: "#079115")
    static let amberYellow = Color(hex: "#ffa800")
    static let homepageText = Color(hex: "#DDDFE0")
    static let yellow = Color(hex: "#FFC300")
    static let textColor = Color(hex: "#4A4B4C")
    static let gray4 = Color(hex: "#343434")
    static let onboardingScreen = Color(hex: "#F5F5F5")
    static let slidingPageText = Color(hex: "#003D4F")

}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

