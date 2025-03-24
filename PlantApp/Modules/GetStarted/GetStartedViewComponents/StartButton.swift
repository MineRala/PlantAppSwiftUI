//
//  StartButton.swift
//  PlantApp
//
//  Created by Mine Rala on 25.03.2025.
//

import SwiftUI

struct StartButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Constants.Colors.white)
                .font(CustomTextStyle.sfpBodyBold)
                .lineSpacing(9)
                .kerning(-0.24)
                .frame(height: 56)
                .background(Constants.Colors.freshGreen)
                .cornerRadius(12)
                .padding(.horizontal, Constants.Padding.padding24)
        }
    }
}

#Preview {
    StartButton(title: "Get Started", action: {})
}
