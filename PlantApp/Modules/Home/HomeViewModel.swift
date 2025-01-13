//
//  HomeViewModel.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import SwiftUI

@Observable
final class HomeViewModel {
    var questionResult: QuestionModels?
    var categoryResult: CategoryModel?
    var isLoading: Bool = false

    func loadDataConcurrently() async {
        isLoading = true
        defer { isLoading = false }

        do {

            let questionModels: QuestionModels = try await APIService.shared.fetchData(endpoint: .getQuestions)
            self.questionResult = questionModels

            let categoryModel: CategoryModel = try await APIService.shared.fetchData(endpoint: .getCategories)
            self.categoryResult = categoryModel

        } catch {
            print("Error occurred: \(error)")
        }
    }
}
