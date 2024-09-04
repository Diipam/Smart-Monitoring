import SwiftUI

struct OnboardingScreenView: View {
    @State private var currentTab = 1 // Keeps track of the current tab

    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.onboardingScreen
                    .ignoresSafeArea()

                TabView(selection: $currentTab) {
                    // First onboarding screen
                    FirstOnboardingView(
                        title: "ようこそ",
                        subtitle: "スマートAIアプリ",
                        description: "太陽光発電の利用は持続可能な未来への重要な一歩です。無限のクリーンエネルギーであり、環境負荷を大幅に軽減します。技術の進歩で効率も向上。地球温暖化や資源枯渇に対処するため、太陽光発電は不可欠です。",
                        buttonTitle: "次へ",
                        buttonAction: {
                            currentTab = 1
                        }
                    )
                    .tag(0)

                    // Second onboarding screen
                    SecondOnboardingView(
                        title: "ログイン,",
                        subtitle: "アプリにログインが成功すると、ご家庭の電力情報をご確認頂けるようになります",
                        description: "ユーザー認証を開始します。お手元にお客様のユーザーIDとパスワードが記載された書類をご用意ください。",
                        buttonTitle: "始める",
                        buttonAction: {
                            currentTab = 0
                        }
                    )
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides the default page indicator
            }
        }
    }
}

struct FirstOnboardingView: View {
    var title: String
    var subtitle: String
    var description: String
    var buttonTitle: String
    var buttonAction: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text(title)
                .foregroundStyle(AppColor.accentBlue)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)

            Text(subtitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .background(AppColor.accentBlue.opacity(0.3))

            Image(.house)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 270, height: 300)
                .padding(.top, -40)


            Text(description)
                .font(.subheadline)
                .foregroundStyle(AppColor.textColor)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, -60)

            HStack(spacing: 20) {
                Circle()
                    .frame(width: 12, height: 12)
                    .foregroundColor(AppColor.accentBlue)
                Circle()
                    .stroke(AppColor.accentBlue)
                    .frame(width: 12, height: 12)
            }
            .padding(.top, 20)

            Button(action: buttonAction) {
                HStack(spacing: 20) {
                    Spacer(minLength: 5)
                    Text(buttonTitle)
                        .font(.title)
                        .foregroundStyle(.white)
                    Image(systemName: "arrow.forward.circle")
                        .foregroundStyle(.white)
                        .font(.title)
                }
            }
            .frame(maxWidth: 150, maxHeight: 50, alignment: .center)
            .padding(.horizontal, 20)
            .background(AppColor.accentBlue)
            .cornerRadius(radius: 20, corners: [.topRight, .bottomRight, .bottomLeft])
            .padding(.bottom, 20)
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 15))
        .padding()
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 2, y: 6)
    }
}

struct SecondOnboardingView: View {
    var title: String
    var subtitle: String
    var description: String
    var buttonTitle: String
    var buttonAction: () -> Void
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(title)
                .foregroundStyle(AppColor.accentBlue)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)

            Image(.tutorial)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(AppColor.textColor)
                .frame(maxWidth: 170)
                .offset(x: 85, y: -150)
                .padding(.horizontal, 10)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(AppColor.textColor)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, -90)

            HStack(spacing: 20) {
                Circle()
                    .stroke(AppColor.accentBlue)
                    .frame(width: 12, height: 12)
                Circle()
                    .foregroundColor(AppColor.accentBlue)
                    .frame(width: 12, height: 12)
            }
            .padding(.top, -25)

            HStack {
                Button(action: buttonAction)
                {
                    Image(systemName: "arrow.backward.circle")
                        .foregroundStyle(AppColor.accentBlue)
                        .font(.title)
                }

                Spacer()

                NavigationLink {
                    MainTabbarView()
                } label: {
                    HStack(spacing: 20) {
                        Text(buttonTitle)
                            .font(.title)
                            .foregroundStyle(.white)
                        Image(systemName: "arrow.forward.circle")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                }
                .frame(maxWidth: 150, maxHeight: 50, alignment: .center)
                .padding(.horizontal, 20)
                .background(AppColor.accentBlue)
                .cornerRadius(radius: 20, corners: [.topRight, .bottomRight, .bottomLeft])

                Spacer()
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 15))
        .padding()
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 2, y: 6)
    }
}

#Preview {
    OnboardingScreenView()
}

