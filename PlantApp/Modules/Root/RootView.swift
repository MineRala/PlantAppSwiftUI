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
            Text("Diagnose View")
        case 2:
            Constants.Colors.white
            Text("Scanner View")
        case 3:
            Constants.Colors.white
            Text("My Garden View")
        case 4:
            Constants.Colors.white
            Text("Profile View")
        default:
            Constants.Colors.white
            Text("Unknown View")
        }
    }
}

#Preview {
    RootView()
}
