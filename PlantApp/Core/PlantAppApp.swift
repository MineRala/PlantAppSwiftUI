//
//  PlantAppApp.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

@main
struct PlantAppApp: App {
    @AppStorage(AppString.hasSeenOnboarding) private var hasSeenOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                RootView()
            } else {
                GetStartedView()
            }
        }
    }
}
