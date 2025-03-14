//
//  OnboardingSubView.swift
//  PlantApp
//
//  Created by Mine Rala on 22.12.2024.
//

import SwiftUI

struct OnboardingSubView: View {
    let page: OnboardingPage
    let continueButtonTapped: () -> Void

    @Binding var selection: Int
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        ZStack {
            Image(Constants.Images.onboardingBackground)
                .resizable()
                .ignoresSafeArea()

            if let rotateImage = page.style.rotateImage {
                Image(rotateImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, Constants.Padding.padding50)
                    .blur(radius: 15)
                    .rotationEffect(.degrees(73.6))
            }

            VStack {
                HStack(alignment: .top, spacing: page.style.titleSpacing) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(page.firstVTitle)
                            .font(.customFont(.rubikMedium, size: 28))
                            .kerning(-1)
                            .foregroundStyle(Constants.Colors.deepGreen)

                        if let secondVTitle = page.secondVTitle {
                            Text(secondVTitle)
                                .font(.customFont(.rubikMedium, size: 28))
                                .kerning(-1)
                                .foregroundStyle(Constants.Colors.deepGreen)
                        }
                    }
                    .padding(.leading, Constants.Padding.padding18)

                    VStack(spacing: 0) {
                        Text(page.boldTitle)
                            .font(.customFont(.rubikExtraBold, size: 28))
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

                Spacer()

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
                            .offset(x: 0, y: -40)
                    }
                }
                .padding(.top, page.style.topPadding)
            }

            if let overlayImage = page.style.overlayImage {
                VStack {
                    Spacer()
                    Image(overlayImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: 235)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .zIndex(0)
                }
            }

            VStack {
                Spacer()
                Button(AppString.continueText) {
                    continueButtonTapped()
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(Constants.Colors.white)
                .font(.customFont(.sfpBold, size: 15))
                .lineSpacing(9)
                .kerning(-0.24)
                .frame(height: 56)
                .background(Constants.Colors.freshGreen)
                .cornerRadius(12)
                .padding(.horizontal, Constants.Padding.padding24)
                .padding(.bottom, Constants.Padding.padding64)
                .zIndex(page.style.overlayImage == nil ? 0 : 1)
            }
        }
    }
}
