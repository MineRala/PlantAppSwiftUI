//
//  TabBarItemView.swift
//  PlantApp
//
//  Created by Mine Rala on 24.12.2024.
//

import SwiftUI

struct TabBarItemView: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: Constants.Spacing.spacing2) {
                Image(imageName)
                    .renderingMode(.template)
                    .tint(isSelected ? Constants.Colors.freshGreen : Constants.Colors.tabItemIcon)
                Text(title)
                    .font(CustomTextStyle.micro)
                    .kerning(-0.24)
                    .foregroundStyle(isSelected ? Constants.Colors.freshGreen : Constants.Colors.tabItemText)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
//    TabBarItemView()
}
