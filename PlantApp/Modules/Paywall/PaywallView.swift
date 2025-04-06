//
//  PaywallView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

struct PaywallView: View {
    @StateObject private var viewModel = PaywallViewModel()

    var body: some View {
        ZStack {
            Constants.Colors.paywallBackground.edgesIgnoringSafeArea(.all)

            Image(Constants.Images.paywallBackground)
                .resizable()
                .scaledToFill()
                .frame(height: 140, alignment: .bottom)

            VStack(spacing: Constants.Spacing.spacing0) {
                VStack(alignment: .leading, spacing: Constants.Spacing.spacing20) {
                    PaywallHeaderView()
                    FeatureScrollView(features: viewModel.features)
                    VStack(spacing: Constants.Spacing.spacing16) {
                        OneMonthView(viewModel: viewModel)
                        OneYearView(viewModel: viewModel)
                    }
                    .padding(.top, Constants.Padding.padding4)
                    PaywallFooterView()
                        .padding(.top, Constants.Padding.padding6)
                }
                Spacer()
            }
            CloseButtonView(viewModel: viewModel)
        }
    }
}

#Preview {
    PaywallView()
}
