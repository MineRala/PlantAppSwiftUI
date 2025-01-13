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
                .padding(.bottom, 16)

                Text(feature.title)
                    .font(.customFont(.rubikMedium, size: 20))
                    .foregroundStyle(Constants.Colors.white)

                Text(feature.subtitle)
                    .font(.customFont(.rubikRegular, size: 13))
                    .foregroundStyle(Constants.Colors.transparentWhite)
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
    FeatureCardView(feature: FeatureModel(title: "Unlimited", subtitle: "Plant Identify", image: Constants.Images.scanner))
}
