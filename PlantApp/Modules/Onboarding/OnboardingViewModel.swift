//
//  OnboardingViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var selection: Int = 0

    private(set) var pages: [OnboardingPage] = [
        OnboardingPage(
            firstVTitle: AppString.takePhoto.localized,
            secondVTitle: AppString.thePlant.localized,
            boldTitle: AppString.identify.localized,
            image: Constants.Images.onBoardScreen1,
            style: OnboardingPageStyle(
                cornerImage: nil,
                overlayImage: nil,
                scaleEffect: 1.07,
                titleSpacing: -Constants.Spacing.spacing10,
                topPadding: Constants.Padding.padding12,
                rotateImage: nil
            )
        ),
        OnboardingPage(
            firstVTitle: AppString.getPlant.localized,
            secondVTitle: nil,
            boldTitle: AppString.careGuides.localized,
            image: Constants.Images.onBoardScreen2,
            style: OnboardingPageStyle(
                cornerImage: Constants.Images.artwork,
                overlayImage: Constants.Images.overlay,
                scaleEffect: 0.88,
                titleSpacing: Constants.Spacing.spacing5,
                topPadding: Constants.Padding.padding20,
                rotateImage: Constants.Images.rotate
            )
        )
    ]

    func continueButtonTapped() {
        guard selection < pages.count else { return }
        withAnimation {
            selection += 1
        }
    }
}
