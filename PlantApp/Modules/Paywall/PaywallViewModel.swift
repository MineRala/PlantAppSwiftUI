//
//  PaywallViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

final class PaywallViewModel: ObservableObject {
    @Published var features: [FeatureModel] = [
        FeatureModel(title: AppString.unlimited, subtitle: AppString.plantIdentify, image: Constants.Images.scanner),
        FeatureModel(title: AppString.faster, subtitle: AppString.process, image: Constants.Images.faster),
        FeatureModel(title: AppString.unlimited, subtitle: AppString.plantIdentify, image: Constants.Images.scanner),
        FeatureModel(title: AppString.faster, subtitle: AppString.process, image: Constants.Images.faster)
    ]
    @Published var isSelectOneYear: Bool = true
    @AppStorage(AppString.hasSeenOnboarding) private var hasSeenOnboarding: Bool = false

    var isSmallScreen: Bool {
        UIScreen.main.bounds.height < 800
    }

    func closeButtonTapped() {
        hasSeenOnboarding = true
    }

    func selectOneYear() {
        isSelectOneYear = true
    }

    func selectOneMonth() {
        isSelectOneYear = false
    }
}
