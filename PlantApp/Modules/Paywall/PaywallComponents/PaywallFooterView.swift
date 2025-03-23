//
//  PaywallFooterView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct PaywallFooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Button(AppString.tryFree) {}
                .foregroundStyle(Constants.Colors.white)
                .font(CustomTextStyle.contentBody)
                .lineSpacing(8)
                .kerning(-0.24)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Constants.Colors.freshGreen)
                .cornerRadius(14)
                .padding(.horizontal)

            VStack(spacing: 10) {
                Text(AppString.afterThreeDay)
                    .font(CustomTextStyle.tinyCaption)
                    .lineSpacing(2.88)
                    .foregroundStyle(Constants.Colors.middleTransparentWhite)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, Constants.Padding.padding24)

                Text(AppString.termsPrivacyRestore)
                    .font(CustomTextStyle.tiny)
                    .foregroundStyle(Constants.Colors.lowTransparentWhite)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

        }
    }
}

#Preview {
    PaywallFooterView()
}
