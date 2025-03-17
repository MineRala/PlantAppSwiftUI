//
//  OneMonthView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct OneMonthView: View {
    @ObservedObject var viewModel: PaywallViewModel

    var body: some View {
        Button(action: {
            viewModel.selectOneMonth()
        }, label: {
            HStack {
                Image(viewModel.isSelectOneYear ? Constants.Images.unselect : Constants.Images.select)
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing: 1) {
                    Text(AppString.oneMonth)
                        .font(.customFont(.rubikMedium, size: 16))
                        .foregroundStyle(Constants.Colors.white)
                    HStack(spacing: 0) {
                        Text(AppString.priceMonth)
                            .font(.customFont(.rubikLight, size: 12))
                            .foregroundStyle(Constants.Colors.transparentWhite)
                        Text(AppString.autoRenewable)
                            .font(.customFont(.rubikRegular, size: 12))
                            .foregroundStyle(Constants.Colors.transparentWhite)
                    }
                }
                Spacer()
            }
        })
        .frame(height: viewModel.isSmallScreen ? 20 : 40)
        .padding()
        .background(
            ZStack {
                Constants.Colors.lowOpacityWhite
                    .blur(radius: 80)
            }
        )
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(viewModel.isSelectOneYear ? Constants.Colors.middleLowOpacityWhite :
                            Constants.Colors.freshGreen, lineWidth: viewModel.isSelectOneYear ? 0.5 : 1.5)
        )
        .padding(.horizontal, Constants.Padding.padding15)
    }
}

#Preview {
    OneMonthView(viewModel: PaywallViewModel())
}
