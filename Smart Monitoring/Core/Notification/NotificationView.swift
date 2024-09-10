//
//  NotificationView.swift
//  Smart Monitoring
//
//  Created by Smart Solar Nepal on 09/09/2024.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            Image(.notification)
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .frame(height: 700)

        }
    }
}

#Preview {
    NotificationView()
}
