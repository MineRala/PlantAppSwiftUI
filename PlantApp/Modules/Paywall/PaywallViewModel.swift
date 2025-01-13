//
//  PaywallViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import Foundation
import SwiftUI

final class PaywallViewModel: ObservableObject {
    @Published var features: [FeatureModel] = [
        FeatureModel(title: "Unlimited", subtitle: "Plant Identify", image: Constants.Images.scanner),
        FeatureModel(title: "Faster", subtitle: "Process", image: Constants.Images.faster),
        FeatureModel(title: "Unlimited", subtitle: "Plant Identify", image: Constants.Images.scanner),
        FeatureModel(title: "Faster", subtitle: "Process", image: Constants.Images.faster)
    ]
    @Published var isSelectOneYear: Bool = true
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false

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
