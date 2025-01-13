//
//  PaywallView.swift
//  PlantApp
//
//  Created by Mine Rala on 21.12.2024.
//

import SwiftUI

struct PaywallView: View {
    @StateObject private var viewModel = PaywallViewModel()

    var body: some View {
        ZStack {
            Constants.Colors.paywallBackground.edgesIgnoringSafeArea(.all)

            Image(Constants.Images.paywallBackground)
                .resizable()
                .scaledToFill()
                .frame(height: 140, alignment: .bottom)

            VStack(alignment: .leading) {
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Plant App")
                            .font(.customFont(.visbyExtraBold, size: 30))
                            .foregroundStyle(Constants.Colors.white)
                        Text("Premium")
                            .font(.customFont(.rubikLight, size: 27))
                            .foregroundColor(Constants.Colors.white)
                    }
                    Text("Access All Features")
                        .font(.customFont(.rubikLight, size: 17))
                        .foregroundColor(Constants.Colors.white)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.features) { feature in
                            FeatureCardView(feature: feature)
                        }
                    }
                }
                .padding()

                VStack(alignment: .leading, spacing: 0) {
                    VStack(spacing: 16) {
                        Button(action: {
                                    viewModel.selectOneMonth()
                                }, label: {
                                    HStack {
                                        Image(viewModel.isSelectOneYear ? "unselect" : "select")
                                            .frame(width: 24, height: 24)
                                        VStack(alignment: .leading) {
                                            Text("1 Month")
                                                .font(.customFont(.rubikMedium, size: 16))
                                                .foregroundStyle(Constants.Colors.white)
                                            Text("$2.99/month, auto renewable")
                                                .font(.customFont(.rubikLight, size: 12))
                                                .foregroundStyle(Constants.Colors.transparentWhite)
                                        }
                                        Spacer()
                                    }
                                })
                                .frame(height: viewModel.isSmallScreen ? 20 : 40)
                                .padding()
                                .background(
                                    ZStack {
                                          Constants.Colors.lowOpacityWhite
                                              .blur(radius: 80)
                                      }
                                )
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(viewModel.isSelectOneYear ? Constants.Colors.middleLowOpacityWhite :
                                                    Constants.Colors.freshGreen, lineWidth: viewModel.isSelectOneYear ? 0.5 : 1.5)
                                )
                                .padding(.horizontal, 15)

                        ZStack(alignment: .topTrailing) {
                            Button(action: {
                                viewModel.selectOneYear()
                            }, label: {
                                HStack {
                                    Image(viewModel.isSelectOneYear ? Constants.Images.select : Constants.Images.unselect)
                                        .frame(width: 24, height: 24) // Görsel boyutunu ayarladım
                                    VStack(alignment: .leading) {
                                        Text("1 Year")
                                            .font(.customFont(.rubikMedium, size: 16))
                                            .foregroundStyle(Constants.Colors.white)
                                        Text("First 3 days free, then $529.99/year")
                                            .font(.customFont(.rubikRegular, size: 12))
                                            .foregroundStyle(Constants.Colors.transparentWhite)
                                    }
                                    Spacer()
                                }
                            })
                            .frame(height: viewModel.isSmallScreen ? 20 : 48)
                            .padding()
                            .background(
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(colors: [Constants.Colors.gradient1, Constants.Colors.gradient2]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .blur(radius: 80)
                                    Constants.Colors.lowOpacityWhite
                                        .blur(radius: 80)
                                }
                            )
                            .cornerRadius(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(viewModel.isSelectOneYear ? Constants.Colors.freshGreen : Constants.Colors.middleLowOpacityWhite, lineWidth: viewModel.isSelectOneYear ? 1.5 : 0.5)
                            )
                            .padding(.horizontal, 15)

                            Image(Constants.Images.badge)
                                .resizable()
                                .frame(width: 77, height: 26)
                                .offset(x: -15, y: 0)
                        }
                    }
                    Button("Try free for 3 days") {}
                        .foregroundStyle(Constants.Colors.white)
                        .font(.customFont(.rubikMedium, size: 16))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Constants.Colors.freshGreen)
                        .cornerRadius(14)
                        .padding()

                    Text("After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable")
                        .font(.customFont(.rubikLight, size: 9))
                        .foregroundStyle(Constants.Colors.middleTransparentWhite)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    Text("Terms • Privacy • Restore")
                        .font(.customFont(.rubikRegular, size: 11))
                        .foregroundStyle(Constants.Colors.lowTransparentWhite)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)

                }
            }

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.closeButtonTapped()
                    }) {
                        Image(Constants.Images.close)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.trailing)

                }
                Spacer()
            }
        }
    }
}

#Preview {
    PaywallView()
}
