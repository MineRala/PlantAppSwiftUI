//
//  TermsAndPrivacyText.swift
//  PlantApp
//
//  Created by Mine Rala on 25.03.2025.
//

import SwiftUI

struct TermsAndPrivacyText: View {
    var body: some View {
        VStack {
            Text(AppString.byTapping.localized)
            HStack(spacing: Constants.Spacing.spacing0) {
                Text(AppString.terms.localized).underline(true, color: Constants.Colors.mutedOlive)
                Text(AppString.ampersand.localized)
                Text(AppString.privacy.localized).underline(true, color: Constants.Colors.mutedOlive)
            }
        }
        .padding(.top, Constants.Padding.padding17)
        .font(CustomTextStyle.tiny)
        .lineSpacing(4)
        .kerning(0.07)
        .foregroundStyle(Constants.Colors.mutedOliveSecondary)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TermsAndPrivacyText()
}
