//
//  PaywallHeaderView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct PaywallHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer(minLength: 20)
            VStack(alignment: .leading) {
                HStack {
                    Text(AppString.plantApp)
                        .font(CustomTextStyle.hugeTitle)
                        .foregroundStyle(Constants.Colors.white)
                    Text(AppString.premium)
                        .font(CustomTextStyle.largeCaption)
                        .foregroundColor(Constants.Colors.white)
                }
                Text(AppString.accessAllFeatures)
                    .font(CustomTextStyle.mediumCaption)
                    .lineSpacing(7)
                    .kerning(0.38)
                    .foregroundColor(Constants.Colors.transparentWhite)
            }
            .padding(.horizontal, Constants.Padding.padding20)
        }
    }
}

#Preview {
    PaywallHeaderView()
}
