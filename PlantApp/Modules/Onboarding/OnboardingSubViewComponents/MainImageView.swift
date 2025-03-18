//
//  MainImageView.swift
//  PlantApp
//
//  Created by Mine Rala on 16.03.2025.
//

import SwiftUI

struct MainImageView: View {
    let page: OnboardingPage

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Spacer()
                Image(page.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(page.style.scaleEffect)
                Spacer()
            }

            if let cornerImage = page.style.cornerImage {
                Image(cornerImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .offset(x: -10, y: -50)
            }
        }
        .padding(.top, page.style.topPadding)
    }
}
