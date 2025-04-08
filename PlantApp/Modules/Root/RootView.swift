//
//  RootView.swift
//  PlantApp
//
//  Created by Mine Rala on 23.12.2024.
//

import SwiftUI

struct RootView: View {
    @State var index = 0
    @State private var homeViewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: Constants.Spacing.spacing0) {
            ZStack {
                getViewForIndex(index)
            }

            CustomTabView(index: self.$index)
        }
        .edgesIgnoringSafeArea(.top)
    }

    @ViewBuilder
    private func getViewForIndex(_ index: Int) -> some View {
        switch index {
        case 0:
            Constants.Colors.softBlush
            HomeView(viewModel: homeViewModel)
        case 1:
            Constants.Colors.white
            Text(AppString.diagnoseView.localized)
        case 2:
            Constants.Colors.white
            Text(AppString.scannerView.localized)
        case 3:
            Constants.Colors.white
            Text(AppString.myGardenView.localized)
        case 4:
            Constants.Colors.white
            Text(AppString.profileView.localized)
        default:
            Constants.Colors.white
            Text(AppString.unknownView.localized)
        }
    }
}

#Preview {
    RootView()
}
