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
                    subtitle: AppString.identifyMore.localized
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
                    StartButton(title: AppString.getStarted.localized) {
                        viewModel.toggleOnboardingView()
                    }
                    TermsAndPrivacyText()
                }
                .padding(.top, -Constants.Padding.padding40)
                .padding(.bottom, Constants.Padding.padding8)
            }
            .fullScreenCover(isPresented: $viewModel.shouldShowOnboardingView) {
                OnboardingView()
            }
        }
    }
}

// MARK: - UI
private extension GetStartedView {
    var formattedTitle: AttributedString {
        var part1 = AttributedString(viewModel.message1)
        part1.font = CustomTextStyle.titleLarge
        part1.tracking = 0.07

        var part2 = AttributedString(viewModel.message2)
        part2.font = CustomTextStyle.titleLargeBold
        part2.tracking = 0.07

        return part1 + part2
    }
}


#Preview {
    GetStartedView()
}
