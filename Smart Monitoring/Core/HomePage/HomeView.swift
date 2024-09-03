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
        VStack(alignment: .leading, spacing: 10) {

            Image(.logo)
                .frame(maxWidth: .infinity, alignment: .top)

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
//            .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .mask(Capsule())

            HStack(spacing: 1) {
                Image(.robot)

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

                    Image(systemName: "chevron.left.circle.fill")
                        .font(.title)
                        .foregroundStyle(AppColor.accentBlue.opacity(0.8))
                }
                .padding(5)
                .background(AppColor.homepageText.opacity(0.8))
//                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .mask(Capsule())

            }


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


            RiveViewModel(fileName: "dimensionanimation").view()
                .offset(y: -10)
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .foregroundStyle(AppColor.accentBlue)
                .overlay {
                    HStack(spacing: 0) {
                        Spacer()
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

                        Spacer()
                    }
                    .font(.subheadline)
                }

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
//            .mask(RoundedRectangle(cornerRadius: 25))
            .mask(Capsule())

            .padding(.top, 25)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
