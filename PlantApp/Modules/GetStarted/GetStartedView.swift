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
        var result = AttributedString(AppString.welcomeTo)
        result.font = .customFont(.rubikRegular, size: 28)
        return result
    }

    var message2: AttributedString {
        var result = AttributedString(AppString.plantApp)
        result.font = .customFont(.rubikBold, size: 28)
        return result
    }

    var body: some View {
        ZStack {
            Image(Constants.Images.background)
                .resizable()
                .ignoresSafeArea(.all)

            VStack(alignment: .leading) {
                GetStartedHeaderView(attributedTitle: message1 + message2, subtitle: AppString.identifyMore)
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
                    Button(AppString.getStarted) {
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
                        Text(AppString.byTapping)
                        HStack(spacing: 0) {
                            Text(AppString.terms).underline(true, color: Constants.Colors.mutedOlive)
                            Text(AppString.ampersand)
                            Text(AppString.privacy).underline(true, color: Constants.Colors.mutedOlive)
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
