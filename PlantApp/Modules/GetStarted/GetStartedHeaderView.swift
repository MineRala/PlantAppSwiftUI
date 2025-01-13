//
//  OnboardingHeaderView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

struct GetStartedHeaderView: View {
    var attributedTitle: AttributedString
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(attributedTitle)
                .foregroundStyle(Constants.Colors.deepGreen)
                Text(subtitle)
                    .font(.customFont(.rubikRegular, size: 16))
                    .foregroundStyle(Constants.Colors.deepGreenSecondary)
        }
    }
}

#Preview {
    var message1: AttributedString {
            var result = AttributedString("Welcome to ")
            result.font = .customFont(.rubikRegular, size: 28)
            result.foregroundColor = Constants.Colors.deepGreen

            return result
        }

        var message2: AttributedString {
            var result = AttributedString("PlantApp!")
            result.font = .customFont(.rubikBold, size: 28)
            result.foregroundColor = Constants.Colors.deepGreen
            return result
        }
    GetStartedHeaderView(attributedTitle: message1 + message2, subtitle: "Identify more than 3000+ plants and 88% accuracy.")
}
