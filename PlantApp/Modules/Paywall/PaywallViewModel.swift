//
//  PaywallViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

final class PaywallViewModel: ObservableObject {
    private(set) var features: [FeatureModel] = [
        FeatureModel(title: AppString.unlimited.localized, subtitle: AppString.plantIdentify.localized, image: Constants.Images.scanner),
        FeatureModel(title: AppString.faster.localized, subtitle: AppString.process.localized, image: Constants.Images.faster),
        FeatureModel(title: AppString.unlimited.localized, subtitle: AppString.plantIdentify.localized, image: Constants.Images.scanner),
        FeatureModel(title: AppString.faster.localized, subtitle: AppString.process.localized, image: Constants.Images.faster)
    ]

    @Published var isYearlySubscriptionSelected: Bool = true
    @AppStorage(AppString.showOnboarding) private var showOnboarding: Bool = true

    var isSmallScreen: Bool {
        UIScreen.main.bounds.height < 800
    }

    func closeButtonTapped() {
        showOnboarding = false
    }

    func selectOneYear() {
        isYearlySubscriptionSelected = true
    }

    func selectOneMonth() {
        isYearlySubscriptionSelected = false
    }
}
