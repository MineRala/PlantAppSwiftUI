//
//  GetStartedView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct GetStartedView: View {
    @StateObject private var viewModel = GetStartedViewModel()

    var body: some View {
        ZStack {
            Image(Constants.Images.background)
                .resizable()
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                GetStartedHeaderView(
                    attributedTitle: formattedTitle,
                    subtitle: AppString.identifyMore
                )
                .padding(.horizontal, Constants.Padding.padding24)

                HStack {
                    Spacer()
                    Image(Constants.Images.getStarted)
                        .resizable()
                        .scaledToFit()
                        .padding(.top, Constants.Padding.padding24)
                    Spacer()
                }

                VStack {
                    startButton
                    termsAndPrivacyText
                }
                .padding(.top, -Constants.Padding.padding40)
                .padding(.bottom, Constants.Padding.padding8)
            }
            .fullScreenCover(isPresented: $viewModel.showFullScreenView) {
                OnboardingView()
            }
        }
    }
}

// MARK: - UI
private extension GetStartedView {
    var formattedTitle: AttributedString {
        var part1 = AttributedString(viewModel.message1)
        part1.font = .customFont(.rubikRegular, size: 28)

        var part2 = AttributedString(viewModel.message2)
        part2.font = .customFont(.rubikBold, size: 28)

        return part1 + part2
    }

    var startButton: some View {
        Button(AppString.getStarted) {
            viewModel.toggleFullScreenView()
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Constants.Colors.white)
        .font(.customFont(.sfpBold, size: 15))
        .frame(height: 56)
        .background(Constants.Colors.freshGreen)
        .cornerRadius(12)
        .padding(.horizontal, Constants.Padding.padding24)
    }

    var termsAndPrivacyText: some View {
        VStack {
            Text(AppString.byTapping)
            HStack(spacing: 0) {
                Text(AppString.terms).underline(true, color: Constants.Colors.mutedOlive)
                Text(AppString.ampersand)
                Text(AppString.privacy).underline(true, color: Constants.Colors.mutedOlive)
            }
        }
        .padding(.top, Constants.Padding.padding17)
        .font(.customFont(.rubikRegular, size: 11))
        .foregroundStyle(Constants.Colors.mutedOliveSecondary)
        .frame(maxWidth: .infinity)
    }
}
