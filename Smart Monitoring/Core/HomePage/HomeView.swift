//
//  HomeView.swift
//  Smart Local Monitoring
//
//  Created by Smart Solar Nepal on 29/08/2024.
//

import SwiftUI
import RiveRuntime


struct HomeView: View {
    var body: some View {
        VStack {
            RiveViewModel(fileName: "rive_smartai").view()

            HStack {
                VStack {
                    HStack{
                        Image(systemName: "house")
                        Text("発電")

                    }
                    Text("6.86 kWh")
                }
//                .backgro

                VStack {
                    HStack{
                        Image(systemName: "house")
                        Text("発電")

                    }
                    Text("6.86 kWh")
                }

                VStack {
                    HStack{
                        Image(systemName: "house")
                        Text("発電")

                    }
                    Text("6.86 kWh")
                }

                VStack {
                    HStack{
                        Image(systemName: "house")
                        Text("発電")

                    }
                    Text("6.86 kWh")
                }
            }
            .padding(5)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(AppColor.accentBlue, lineWidth: 2)
            }
//
        }
    }
}

#Preview {
    HomeView()
}
