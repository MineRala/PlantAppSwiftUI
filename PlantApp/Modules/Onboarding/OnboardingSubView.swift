//
//  OnboardingSubView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
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

            if !viewModel.isFirstPage {
                Image(Constants.Images.rotate)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, Constants.Padding.padding50)
                    .blur(radius: 15)
                    .rotationEffect(.degrees(73.6))
            }

            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .leading, spacing: viewModel.isFirstPage ? -5 : 5) {
                        Text(page.firstVTitle)
                            .font(.customFont(.rubikMedium, size: 28))
                            .foregroundStyle(Constants.Colors.deepGreen)

                        if let secondVTitle = page.secondVTitle {
                            Text(secondVTitle)
                                .font(.customFont(.rubikMedium, size: 28))
                                .foregroundStyle(Constants.Colors.deepGreen)
                        }
                    }
                    .padding(.leading, Constants.Padding.padding18)

                    VStack(spacing: 0) {
                        Text(page.boldTitle)
                            .font(.customFont(.rubikExtraBold, size: 28))
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
                            .clipped()
                            .scaleEffect(!viewModel.isFirstPage ? 1 : 1.2)
                            .padding(.top, !viewModel.isFirstPage ? Constants.Padding.padding50 : Constants.Padding.padding0)
                            .animation(.easeInOut(duration: 0), value: viewModel.isFirstPage)
                        Spacer()
                    }

                    if let cornerImage = page.cornerImage {
                        Image(cornerImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .offset(x: 0, y: -40)
                    }
                }
                .padding(.top, !viewModel.isFirstPage ? Constants.Padding.padding12 : Constants.Padding.padding40)

                Button(AppString.continueText) {
                    continueButtonTapped()
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(Constants.Colors.white)
                .font(.customFont(.sfpBold, size: 15))
                .frame(height: 56)
                .background(Constants.Colors.freshGreen)
                .cornerRadius(12)
                .padding(.horizontal, Constants.Padding.padding24)
                .padding(.bottom, Constants.Padding.padding64)
                .padding(.top, !viewModel.isFirstPage ? -Constants.Padding.padding50 : Constants.Padding.padding0)
//                .overlay(
//                    Image("overlay")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 235)
//                )
            }
        }
    }
}

#Preview {
    OnboardingSubView(
        page: OnboardingPage(
            firstVTitle: AppString.takePhoto,
            secondVTitle: AppString.thePlant,
            boldTitle: AppString.identify,
            image: Constants.Images.onBoardScreen1,
            cornerImage: nil
        ),
        continueButtonTapped: {},
        selection: .constant(0), viewModel: OnboardingViewModel()
    )
}
