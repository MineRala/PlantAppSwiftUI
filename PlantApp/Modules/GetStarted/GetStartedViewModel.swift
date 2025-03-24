//
//  GetStartedViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

final class GetStartedViewModel: ObservableObject {
    @Published var shouldShowOnboardingView = false

    private(set) var message1: String = AppString.welcomeTo
    private(set) var message2: String = AppString.plantApp

    func toggleOnboardingView() {
        shouldShowOnboardingView.toggle()
    }
}
