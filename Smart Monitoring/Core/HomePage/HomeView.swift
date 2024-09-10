//
//  HomeView.swift
//  Smart Local Monitoring
//
//  Created by Smart Solar Nepal on 29/08/2024.
//

import SwiftUI
import RiveRuntime


struct HomeView: View {
    @State var openChargingSection: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(.logo)
                .frame(maxWidth: .infinity, alignment: .top)

            StatusBar()
            WeatherBar(openChargingSection: $openChargingSection)

            AIChargingInfoBox()

            RiveViewModel(fileName: "dimensionanimation4").view()
                .frame(minWidth: 300, maxWidth: 350, minHeight: 200, maxHeight: 350, alignment: .leading)
                .offset(y: -15)

            EnergyInfoBox()
            EnergyPredictionBar()

            Spacer()
        }
        .overlay {
            if openChargingSection {
                withAnimation(.spring) {
                    ChargingSection()
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .padding(.horizontal)
    }
}

struct StatusBar: View {
    var body: some View {
        HStack(spacing: 6) {
            Text("2024/09/02")
                .font(.subheadline)
            Rectangle()
                .frame(width: 1, height:  15)
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(AppColor.accentBlue.opacity(0.8))
            Text("遠隔監視中")
                .font(.subheadline)
                .fontWeight(.semibold)

            Rectangle()
                .frame(width: 1, height:  15)

            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(AppColor.green)


            Text("自家消費モード")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .padding(5)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(AppColor.homepageText.opacity(0.8))
        .mask(Capsule())

    }
}

struct ChargingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ChargingSectionHeader(title1: "本日", title2: "昨日")
            ForEach(0..<4) { index in
                ChargingSectionRow(icon: "house", title: "発電", value1: "13.5", value2: "23.7", showDivider: index != 3)
            }
            ChargingSectionHeader(title1: "今月", title2: "先月")
            ForEach(0..<2) { index in
                ChargingSectionRow(icon: "house", title: "発電", value1: "13.5", value2: "23.7", showDivider: index != 1)
            }
        }
        .background(.white)
        .mask(Rectangle())
        .offset(y: 75)
        .padding(.top)
    }
}

struct ChargingSectionHeader: View {
    let title1: String
    let title2: String

    var body: some View {

        HStack(spacing: 0) {
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 80, height: 2)

            Spacer()
            Text(title1)
            Spacer()
            Text(title2)
        }
        .foregroundStyle(.white)
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(5)
        .padding(.horizontal)
        .background(AppColor.accentBlue)
        .clipShape(Capsule())
    }
}

struct ChargingSectionRow: View {
    let icon: String
    let title: String
    let value1: String
    let value2: String
    let showDivider : Bool

    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 20) {
                Image(systemName: icon).font(.title2)
                Text(title).font(.headline)
                Spacer()
                Text("\(value1)\(Text("kWh").font(.caption))").font(.headline)
                Spacer()
                Text("\(value2)\(Text("kWh").font(.caption))").font(.headline)
            }
            .padding(.horizontal)
            .foregroundStyle(AppColor.slidingPageText)

            if showDivider {
                Divider()
                    .padding(.horizontal, 10)
            }
        }
    }
}


struct WeatherBar: View {
    @Binding var openChargingSection: Bool
    @State private var isBlinking = false
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack(spacing: 1) {
            if isBlinking {
                Image(.robotBlink)
            } else {
                Image(.robot)
            }
            Spacer()

            HStack(spacing: 10) {

                VStack(spacing: 5) {
                    Text("木更津市、かずさ鎌足")
                        .font(.footnote)
                        .lineLimit(1)
                        .padding(.horizontal, 5)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(AppColor.accentBlue.opacity(0.8))
                        .padding(.horizontal, 5)
                }
                Text("25°C")
                    .font(.title2)
                    .fontWeight(.semibold)

                Image(systemName: "sun.max.fill")
                    .font(.title)
                    .foregroundStyle(AppColor.amberYellow)

                Button {
                    withAnimation {
                        openChargingSection.toggle()
                    }

                } label: {
                    withAnimation {
                        Image(systemName: openChargingSection ? "chevron.right.circle.fill" : "chevron.left.circle.fill")
                            .font(.title)
                            .foregroundStyle(AppColor.accentBlue.opacity(0.8))
                    }
                }

            }
            .padding(5)
            .background(AppColor.homepageText.opacity(0.8))
            .mask(Capsule())
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: 0.2)) {
                isBlinking.toggle()
            }
        })
    }
}

struct AIChargingInfoBox: View {
    var body: some View {
        Text("今晩のAI充電目標値は50%です。 目標値まで充放電が行われた後は夜間充電時間終了までは蓄電池は待機状態となります。")
            .font(.footnote)
            .foregroundStyle(.white)
            .padding(10)
            .background(AppColor.accentBlue)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(alignment: .topLeading) {
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.title)
                    .rotationEffect(.degrees(170))
                    .offset(x: 10, y: -22.4)
                    .foregroundStyle(AppColor.accentBlue)
            }
            .padding(.top, 10)
    }
}

struct EnergyInfoBox: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .frame(maxWidth: .infinity, maxHeight: 80)
//            .overlay {
                HStack(spacing: 0) {
//                    Spacer()
                    VStack(spacing: 10) {
                        HStack{
                            Image(systemName: "house")
                            Text("発電")

                        }
                        Text("6.86 kWh")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 6)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 10))

                    Spacer()

                    VStack(spacing: 10)  {
                        HStack{
                            Image(systemName: "house")
                            Text("発電")

                        }
                        Text("6.86 kWh")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 6)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 10))

                    Spacer()

                    VStack(spacing: 10)  {
                        HStack{
                            Image(systemName: "house")
                            Text("発電")

                        }
                        Text("6.86 kWh")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 6)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 10))

                    Spacer()

                    VStack(spacing: 10)  {
                        HStack{
                            Image(systemName: "house")
                            Text("発電")

                        }
                        Text("6.86 kWh")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 10))

//                    Spacer()
                }
                .font(.subheadline)
                .padding(5)
                .background(AppColor.accentBlue)
                .mask(RoundedRectangle(cornerRadius: 10))
//            }
//            .offset(y: -10)
    }
}

struct EnergyPredictionBar: View {
    var body: some View {
        HStack(spacing: 10) {
            HStack(spacing: 1) {
                Text("発電予測")
                    .font(.footnote)

                Text("25.32")
                    .fontWeight(.bold)
                Text("KW")
                    .font(.footnote)
            }

            Rectangle()
                .frame(width: 2 , height: 20)

            Text("消費予測 22.03 kw")

        }
        .frame(maxWidth: .infinity)
        .padding(5)
        .background(AppColor.homepageText.opacity(0.8))
        .mask(Capsule())
        .padding(.top, 20)
    }
}

#Preview {
    HomeView()
}
