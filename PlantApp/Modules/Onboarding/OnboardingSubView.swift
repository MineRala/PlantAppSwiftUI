//
//  OnboardingSubView.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct OnboardingSubView: View {
    let page: OnboardingPage
    let continueButtonTapped: () -> Void

    @Binding var selection: Int
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        ZStack {
            Image(Constants.Images.onboardingBackground)
                .resizable()
                .ignoresSafeArea()

            RotatedImageView(imageName: page.style.rotateImage)

            VStack(spacing: Constants.Spacing.spacing0) {
                TitleView(page: page)
                Spacer()
                MainImageView(page: page)
            }

            OverlayImageView(imageName: page.style.overlayImage)

            VStack(spacing: Constants.Spacing.spacing0) {
                Spacer()
                ContinueButtonView(action: continueButtonTapped, hasOverlay: page.style.overlayImage != nil)
            }
        }
    }
}
