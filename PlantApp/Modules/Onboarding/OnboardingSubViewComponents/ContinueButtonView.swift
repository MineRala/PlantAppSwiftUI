//
//  ContinueButtonView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct ContinueButtonView: View {
    let action: () -> Void
    let hasOverlay: Bool

    var body: some View {
        Button(AppString.continueText) {
            action()
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Constants.Colors.white)
        .font(CustomTextStyle.sfpBodyBold)
        .lineSpacing(9)
        .kerning(-0.24)
        .frame(height: 56)
        .background(Constants.Colors.freshGreen)
        .cornerRadius(12)
        .padding(.horizontal, Constants.Padding.padding24)
        .padding(.bottom, Constants.Padding.padding64)
        .zIndex(hasOverlay ? 1 : 0)
    }
}

#Preview {
    ContinueButtonView(action: {
        print("Button tapped!")
    }, hasOverlay: true)
}
