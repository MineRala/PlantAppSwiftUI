//
//  RootView.swift
//  PlantApp
//
//  Created by Mine Rala on 23.12.2024.
//

import SwiftUI

struct RootView: View {
    @State var index = 0

    var body: some View {
        VStack(spacing: 0) {
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
            HomeView()
        case 1:
            Constants.Colors.white
            Text(AppString.diagnoseView)
        case 2:
            Constants.Colors.white
            Text(AppString.scannerView)
        case 3:
            Constants.Colors.white
            Text(AppString.myGardenView)
        case 4:
            Constants.Colors.white
            Text(AppString.profileView)
        default:
            Constants.Colors.white
            Text(AppString.unknownView)
        }
    }
}

#Preview {
    RootView()
}