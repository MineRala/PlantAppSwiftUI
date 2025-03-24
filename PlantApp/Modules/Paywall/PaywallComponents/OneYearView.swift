//
//  OneYearView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct OneYearView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                viewModel.selectOneYear()
            }, label: {
                HStack {
                    Image(viewModel.isYearlySubscriptionSelected ? Constants.Images.select : Constants.Images.unselect)
                        .frame(width: 24, height: 24)
                    VStack(alignment: .leading, spacing: 1) {
                        Text(AppString.oneYear)
                            .font(CustomTextStyle.contentBody)
                            .foregroundStyle(Constants.Colors.white)
                        Text(AppString.threeDayFree)
                            .font(CustomTextStyle.small)
                            .foregroundStyle(Constants.Colors.transparentWhite)
                    }
                    Spacer()
                }
            })
            .frame(height: viewModel.isSmallScreen ? 20 : 48)
            .padding()
            .background(
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Constants.Colors.gradient1, Constants.Colors.gradient2]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .blur(radius: 80)
                    Constants.Colors.lowOpacityWhite
                        .blur(radius: 80)
                }
            )
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(viewModel.isYearlySubscriptionSelected ? Constants.Colors.freshGreen : Constants.Colors.middleLowOpacityWhite, lineWidth: viewModel.isYearlySubscriptionSelected ? 1.5 : 0.5)
            )
            .padding(.horizontal, Constants.Padding.padding15)

            Image(Constants.Images.badge)
                .resizable()
                .frame(width: 77, height: 26)
                .offset(x: -15, y: 0)
        }
    }
}

#Preview {
    OneYearView(viewModel: PaywallViewModel())
}
