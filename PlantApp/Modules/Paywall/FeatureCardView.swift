//
//  FeatureCardView.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct FeatureCardView: View {
    let feature: FeatureModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Constants.Colors.transparentBlack)
                        .frame(width: 36, height: 35)
                        .cornerRadius(8)

                    Image(feature.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                }
                .padding(.bottom, Constants.Padding.padding16)

                VStack(alignment: .leading, spacing: 4) {
                    Text(feature.title)
                        .font(.customFont(.rubikMedium, size: 20))
                        .lineSpacing(4)
                        .kerning(0.38)
                        .foregroundStyle(Constants.Colors.white)

                    Text(feature.subtitle)
                        .font(.customFont(.rubikRegular, size: 13))
                        .lineSpacing(5)
                        .kerning(-0.08)
                        .foregroundStyle(Constants.Colors.transparentWhite)
                }
            }
            Spacer()
        }
        .padding(.leading)
        .frame(width: 156, height: 130)

        .background(
            Image(Constants.Images.featureCardBackground)
                .resizable()
                .scaledToFill()
                .clipped()
        )
        .cornerRadius(12)
    }
}

#Preview {
    FeatureCardView(feature: FeatureModel(title: AppString.unlimited, subtitle: AppString.plantIdentify, image: Constants.Images.scanner))
}
