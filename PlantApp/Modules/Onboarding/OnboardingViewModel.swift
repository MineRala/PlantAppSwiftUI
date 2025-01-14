//
//  OnboardingViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import Foundation
import SwiftUI

struct OnboardingPage {
    let firstVTitle: String
    let secondVTitle: String?
    let boldTitle: String
    let image: String
    let cornerImage: String?
}

final class OnboardingViewModel: ObservableObject {
    @Published var selection: Int = 0

    var isFirstPage: Bool {
        selection == 0
    }

    let pages: [OnboardingPage] = [
        OnboardingPage(
            firstVTitle: AppString.takePhoto,
            secondVTitle: AppString.thePlant,
            boldTitle: AppString.identify,
            image: Constants.Images.onBoardScreen1,
            cornerImage: nil
        ),
        OnboardingPage(
            firstVTitle: AppString.getPlant,
            secondVTitle: nil,
            boldTitle: AppString.careGuides,
            image: Constants.Images.onBoardScreen2,
            cornerImage: Constants.Images.artwork
        )
    ]

    func continueButtonTapped() {
        guard selection < pages.count else { return }
        withAnimation {
            selection += 1
        }
    }

    func setupPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
        UIPageControl.appearance().backgroundStyle = .minimal
        UIPageControl.appearance().clipsToBounds = true
    }
}
