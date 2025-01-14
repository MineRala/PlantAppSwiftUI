//
//  OnboardingSubView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

struct OnboardingSubView: View {
    let page: OnboardingPage
    var continueButtonTapped: () -> Void

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
                    .rotationEffect(.degrees(-76))
                    .padding(.top, 50)
                    .blur(radius: 15)
            }

            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(page.firstVTitle)
                            .font(.customFont(.rubikMedium, size: 28))
                            .foregroundStyle(Constants.Colors.deepGreen)

                        if let secondVTitle = page.secondVTitle {
                            Text(secondVTitle)
                                .font(.customFont(.rubikMedium, size: 28))
                                .foregroundStyle(Constants.Colors.deepGreen)
                        }
                    }
                    .padding(.leading, 18)

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
                .padding(.top, 12)

                Spacer()

                ZStack(alignment: .topTrailing) {
                    HStack {
                        Spacer()
                        Image(page.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .scaleEffect(!viewModel.isFirstPage ? 1 : 1.2)
                            .padding(.top, !viewModel.isFirstPage ? 50 : 0)
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
                .padding(.top, !viewModel.isFirstPage ? 12 : 40)

                Button(AppString.continueText) {
                    continueButtonTapped()
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(Constants.Colors.white)
                .font(.customFont(.sfpBold, size: 15))
                .frame(height: 56)
                .background(Constants.Colors.freshGreen)
                .cornerRadius(12)
                .padding(.horizontal, 24)
                .padding(.bottom, 64)
                .padding(.top, !viewModel.isFirstPage ? -50 : 0)
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
