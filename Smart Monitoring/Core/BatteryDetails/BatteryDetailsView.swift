//
//  BatteryDetailsView.swift
//  Smart Monitoring
//
//  Created by Smart Solar Nepal on 10/09/2024.
//

import SwiftUI

struct BatteryDetailsView: View {
    var body: some View {
        VStack {
            Image(.batteryDetails)
                .resizable()
                .renderingMode(.original)
                .padding(.top, -20)
        }
    }
}

#Preview {
    BatteryDetailsView()
}
