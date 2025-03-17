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
                        .font(.customFont(.visbyExtraBold, size: 30))
                        .foregroundStyle(Constants.Colors.white)
                    Text(AppString.premium)
                        .font(.customFont(.rubikLight, size: 27))
                        .foregroundColor(Constants.Colors.white)
                }
                Text(AppString.accessAllFeatures)
                    .font(.customFont(.rubikLight, size: 17))
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
