//
//  HomeView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

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

                    SectionTitleView(title: AppString.getStarted)

                    if !viewModel.questions.isEmpty {
                        QuestionListView(questions: viewModel.questions)
                    }

                    if !viewModel.categories.isEmpty {
                        CategoryGridView(categories: viewModel.categories)
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
