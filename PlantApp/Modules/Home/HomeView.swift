//
//  HomeView.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

struct HomeView: View {
    @Bindable var viewModel: HomeViewModel

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

                    SectionTitleView(title: AppString.getStarted.localized)
                    switch viewModel.viewState {
                    case .loading:
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)

                    case .dataLoaded(let questions, let categories):
                        if !questions.isEmpty {
                            QuestionListView(questions: questions)
                        }
                        if !categories.isEmpty {
                            CategoryGridView(categories: categories)
                        }

                    case .error(let message):
                        Text("Error: \(message)")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    viewModel.viewDidAppear()
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(homeService: HomeService()))
}
