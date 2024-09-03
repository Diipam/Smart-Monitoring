//
//  MainTabbarView.swift
//  Smart Local Monitoring
//
//  Created by Deepam Dhakal on 16/07/2024.
//

import SwiftUI

struct MainTabbarView: View {

    @State private var activeTab: Tab = .home
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()

            VStack(spacing: 0) {
                TabView(selection: $activeTab) {
                    Text("Notification")
                        .tag(Tab.notification)

                    Text("Graph")
                        .tag(Tab.graph)

                    HomeView()
                        .tag(Tab.home)

                    Text("Details")
                        .tag(Tab.details)

                    Text("Settings")
                        .tag(Tab.settings)
                }
                customTabbar(tint: AppColor.accentBlue, inactiveTint: .blue)
                    .modifier(TabbarModifier())
            }
        }
        .navigationBarBackButtonHidden(true)
    }

//    Custom Tabbar
//    with easy modificaion

    @ViewBuilder
    func customTabbar(tint: Color, inactiveTint: Color ) -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    activeTab: $activeTab
                )
            }
            .padding(3)
            .background(.white)
            .mask(Circle())
            .shadow(radius: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    @Binding var activeTab: Tab
    var body: some View {
        HStack() {
            Image(systemName: tab.systemImage)
                .font(.title)
                .foregroundStyle(AppColor.accentBlue.opacity(0.8))
                // Increasing size for active state
                .frame(width: activeTab == tab ? 55: 35, height: activeTab == tab ? 55: 35)
                .overlay(content: {
                    if activeTab == tab {
                        Circle()
                            .stroke(AppColor.accentBlue, lineWidth: 4)
                    }
                })
        }
        .frame(maxWidth: .infinity)
        .contentShape(Circle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

#Preview {
    MainTabbarView()
}
