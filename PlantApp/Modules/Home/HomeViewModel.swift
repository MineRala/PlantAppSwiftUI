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
    private let networkManager: NetworkClient

    init(networkManager: NetworkClient = NetworkManager.shared) {
        self.networkManager = networkManager
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
            let questionModels: QuestionModels = try await networkManager.fetch(endpoint: .getQuestions)

            let categoryModel: CategoryModel = try await networkManager.fetch(endpoint: .getCategories)

            viewState = .dataLoaded(questions: questionModels, categories: categoryModel.data.compactMap { $0 })

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
            async let questionModels: QuestionModels = networkManager.fetch(endpoint: .getQuestions)
            async let categoryModel: CategoryModel = networkManager.fetch(endpoint: .getCategories)

            let (questions, categories) = try await (questionModels, categoryModel)

            viewState = .dataLoaded(questions: questions, categories: categories.data.compactMap { $0 })

        } catch let error as AppError {
            viewState = .error(message: error.errorMessage)
            print("Error occurred: \(error)")
        } catch {
            viewState = .error(message: AppError.networkError(error).errorMessage)
            print("Error occurred: \(error)")
        }
    }
}
