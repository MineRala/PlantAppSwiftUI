//
//  PlantAppApp.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

@main
struct PlantAppApp: App {
    @AppStorage(AppString.showOnboarding) private var showOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                GetStartedView()
            } else {
                RootView()
            }

/// Ana View'ın üstüne onboarding açtırmak istiyorsak.
//            RootView()
//                .fullScreenCover(isPresented: $hasSeenOnboarding) {
//                    GetStartedView()
//                }
        }
    }
}
