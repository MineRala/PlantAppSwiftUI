//
//  HomeViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

@Observable
final class HomeViewModel {
    private var questionResult: QuestionModels?
    private var categoryResult: CategoryModel?
    var isLoading: Bool = false
    var errorMessage: String?

    private let networkManager: NetworkClient

    init(networkManager: NetworkClient = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    var questions: QuestionModels {
        questionResult ?? []
    }

    var categories: [CategoryDataModel] {
        categoryResult?.data.compactMap { $0 } ?? []
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
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let questionModels: QuestionModels = try await networkManager.fetch(endpoint: .getQuestions)
            self.questionResult = questionModels

            let categoryModel: CategoryModel = try await networkManager.fetch(endpoint: .getCategories)
            self.categoryResult = categoryModel

        } catch let error as AppError {
            self.errorMessage = error.errorMessage
            print("Error occurred: \(error)")
        } catch {
            self.errorMessage = AppError.networkError(error).errorMessage
            print("Error occurred: \(error)")
        }
    }

    private func loadDataConcurrent() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            async let questionModels: QuestionModels = networkManager.fetch(endpoint: .getQuestions)
            async let categoryModel: CategoryModel = networkManager.fetch(endpoint: .getCategories)

            let (questions, categories) = try await (questionModels, categoryModel)

            self.questionResult = questions
            self.categoryResult = categories

        } catch let error as AppError {
            self.errorMessage = error.errorMessage
            print("Error occurred: \(error)")
        } catch {
            self.errorMessage = AppError.networkError(error).errorMessage
            print("Error occurred: \(error)")
        }
    }
}
