//
//  GetStartedViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

final class GetStartedViewModel: ObservableObject {
    @Published var showFullScreenView = false

    let message1: String = AppString.welcomeTo
    let message2: String = AppString.plantApp

    func toggleFullScreenView() {
        showFullScreenView.toggle()
    }
}
