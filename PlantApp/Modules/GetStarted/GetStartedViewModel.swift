//
//  GetStartedViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

final class GetStartedViewModel: ObservableObject {
    @Published var showFullScreenView = false

    func toggleFullScreenView() {
        showFullScreenView.toggle()
    }
}
