//
//  OnboardingView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI
struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack {
            TabView(selection: $viewModel.selection) {
                ForEach(0..<viewModel.pages.count, id: \.self) { index in
                    let page = viewModel.pages[index]
                    OnboardingSubView(
                        page: page,
                        continueButtonTapped: viewModel.continueButtonTapped,
                        selection: $viewModel.selection,
                        viewModel: viewModel
                    )
                    .tag(index)

                }

                PaywallView()
                    .tag(viewModel.pages.count)

            }
            .background(Color.clear)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: viewModel.selection == viewModel.pages.count ? .never : .automatic))
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            viewModel.setupPageControlAppearance()
        }
    }
}
