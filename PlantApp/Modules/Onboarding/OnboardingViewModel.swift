//
//  OnboardingViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct OnboardingPageStyle {
    let cornerImage: String?
    let overlayImage: String?
    let scaleEffect: CGFloat
    let titleSpacing: CGFloat
    let topPadding: CGFloat
    let rotateImage: String?
}

struct OnboardingPage {
    let firstVTitle: String
    let secondVTitle: String?
    let boldTitle: String
    let image: String
    let style: OnboardingPageStyle
}

final class OnboardingViewModel: ObservableObject {
    @Published var selection: Int = 0

    private(set) var pages: [OnboardingPage] = [
        OnboardingPage(
            firstVTitle: AppString.takePhoto,
            secondVTitle: AppString.thePlant,
            boldTitle: AppString.identify,
            image: Constants.Images.onBoardScreen1,
            style: OnboardingPageStyle(
                cornerImage: nil,
                overlayImage: nil,
                scaleEffect: 1,
                titleSpacing: -10,
                topPadding: Constants.Padding.padding40,
                rotateImage: nil
            )
        ),
        OnboardingPage(
            firstVTitle: AppString.getPlant,
            secondVTitle: nil,
            boldTitle: AppString.careGuides,
            image: Constants.Images.onBoardScreen2,
            style: OnboardingPageStyle(
                cornerImage: Constants.Images.artwork,
                overlayImage: Constants.Images.overlay,
                scaleEffect: 0.8,
                titleSpacing: 5,
                topPadding: Constants.Padding.padding12,
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
