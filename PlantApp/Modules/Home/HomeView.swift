//
//  HomeView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Constants.Colors.softBlush
                    .ignoresSafeArea()
                VStack {
                    HomeHeaderView()
                        .frame(height: 175)

                    PremiumAvailableView()
                        .frame(height: 64)
                        .padding(.all, Constants.Padding.padding24)

                    Text(AppString.getStarted)
                        .font(.customFont(.rubikMedium, size: 15))
                        .foregroundStyle(Constants.Colors.deepGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Constants.Padding.padding24)

                    if let questions = viewModel.questionResult {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(questions) { question in
                                    QuestionCardView(model: question)
                                }
                            }
                            .padding(.horizontal, Constants.Padding.padding24)
                        }
                    }

                    if let categories = viewModel.categoryResult?.data {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridItems, spacing: 16) {
                                ForEach(categories.compactMap { $0 }) { category in
                                    CategoryCardView(model: category)
                                }
                            }
                            .padding(.horizontal, Constants.Padding.padding24)
                        }
                        .padding(.top)
                        .padding(.bottom)
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.loadDataConcurrent()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

