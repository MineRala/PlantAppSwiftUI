//
//  GetStartedView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct GetStartedView: View {
    @StateObject private var viewModel = GetStartedViewModel()

    var message1: AttributedString {
        var result = AttributedString("Welcome to ")
        result.font = .customFont(.rubikRegular, size: 28)
        return result
    }

    var message2: AttributedString {
        var result = AttributedString("PlantApp")
        result.font = .customFont(.rubikBold, size: 28)
        return result
    }

    var body: some View {
        ZStack {
            Image(Constants.Images.background)
                .resizable()
                .ignoresSafeArea(.all)

            VStack(alignment: .leading) {
                GetStartedHeaderView(attributedTitle: message1 + message2, subtitle: "Identify more than 3000+ plants and 88% accuracy.")
                    .padding(.leading, 24)
                    .padding(.trailing, 32)

                HStack() {
                    Spacer()
                    Image(Constants.Images.getStarted)
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 24)
                    Spacer()
                }

                VStack(alignment: .center) {
                    Button("Get Started") {
                        viewModel.toggleFullScreenView()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Constants.Colors.white)
                    .font(.customFont(.sfpBold, size: 15))
                    .frame(height: 56)
                    .background(Constants.Colors.freshGreen)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)

                    VStack(alignment: .center) {
                        Text("By tapping next, you are agreeing to PlantID")
                        HStack(spacing: 0) {
                            Text("Terms of Use").underline(true, color: Constants.Colors.mutedOlive)
                            Text(" & ")
                            Text("Privacy Policy.").underline(true, color: Constants.Colors.mutedOlive)
                        }
                    }
                    .padding(.top, 17)
                    .font(.customFont(.rubikRegular, size: 11))
                    .foregroundStyle(Constants.Colors.mutedOliveSecondary)
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, -40)
                .padding(.bottom, 8)
            }
            .fullScreenCover(isPresented: $viewModel.showFullScreenView) {
                OnboardingView()
            }
        }
    }
}

#Preview {
    GetStartedView()
}
