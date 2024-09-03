//
//  TabModifier.swift
//  Smart Local Monitoring
//
//  Created by Smart Solar Nepal on 29/08/2024.
//

import SwiftUI

struct TabbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(.ultraThinMaterial.opacity(0.8))
            .background(AppColor.tabbarBackground)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: AppColor.accentBlue.opacity(0.3), radius: 5, x: 2, y: 10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(AppColor.accentBlue)
            })
            .padding(.horizontal, 24)
//            .padding(.bottom, 20)

    }

}

extension View {
    func tabbarModifer() -> some View {
        modifier(TabbarModifier())
    }
}
