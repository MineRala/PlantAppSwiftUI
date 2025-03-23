//
//  TitleView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct TitleView: View {
    let page: OnboardingPage

    var body: some View {
        HStack(alignment: .top, spacing: page.style.titleSpacing) {
            VStack(alignment: .leading, spacing: 0) {
                Text(page.firstVTitle)
                    .font(CustomTextStyle.superHeadline)
                    .kerning(-1)
                    .foregroundStyle(Constants.Colors.deepGreen)

                if let secondVTitle = page.secondVTitle {
                    Text(secondVTitle)
                        .font(CustomTextStyle.superHeadline)
                        .kerning(-1)
                        .foregroundStyle(Constants.Colors.deepGreen)
                }
            }
            .padding(.leading, Constants.Padding.padding18)

            VStack(spacing: 0) {
                Text(page.boldTitle)
                    .font(CustomTextStyle.extraBoldTitle)
                    .kerning(-1)
                    .foregroundStyle(Constants.Colors.deepGreen)

                Image(Constants.Images.brush)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 13)
            }
            Spacer()
        }
        .padding(.top, Constants.Padding.padding12)
    }
}
