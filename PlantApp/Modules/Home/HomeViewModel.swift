//
//  HomeViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

@Observable
final class HomeViewModel {
    var viewState: ViewState = .loading
    private let homeService: HomeServiceProtocol

    init(homeService: HomeServiceProtocol = HomeService()) {
        self.homeService = homeService
    }

    func viewDidAppear() {
        Task {
            await loadDataConcurrent()
        }
    }
}

// MARK: - Private
extension HomeViewModel {
    private func loadDataSerial() async {
        viewState = .loading

        do {
            let questions = try await homeService.fetchQuestions()
            let categories = try await homeService.fetchCategories()

            viewState = .dataLoaded(questions: questions, categories: categories.data.compactMap { $0 })

        } catch let error as AppError {
            viewState = .error(message: error.errorMessage)
            print("Error occurred: \(error)")
        } catch {
            viewState = .error(message: AppError.networkError(error).errorMessage)
            print("Error occurred: \(error)")
        }
    }

    private func loadDataConcurrent() async {
        viewState = .loading

        do {
            async let questions = homeService.fetchQuestions()
            async let categories = homeService.fetchCategories()

            let (questionsResult, categoriesResult) = try await (questions, categories)

            viewState = .dataLoaded(questions: questionsResult, categories: categoriesResult.data.compactMap { $0 })

        } catch let error as AppError {
            viewState = .error(message: error.errorMessage)
            print("Error occurred: \(error)")
        } catch {
            viewState = .error(message: AppError.networkError(error).errorMessage)
            print("Error occurred: \(error)")
        }
    }
}
