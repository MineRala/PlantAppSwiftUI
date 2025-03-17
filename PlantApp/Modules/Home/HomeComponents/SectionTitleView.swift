//
//  SectionTitleView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.customFont(.rubikMedium, size: 15))
            .lineSpacing(5)
            .kerning(-0.24)
            .foregroundStyle(Constants.Colors.deepGreen)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Constants.Padding.padding24)
    }
}

#Preview {
    SectionTitleView(title: "Title")
}
