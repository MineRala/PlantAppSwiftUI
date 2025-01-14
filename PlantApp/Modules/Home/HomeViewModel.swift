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
    
    func loadDataSerial() async {
        isLoading = true
        defer { isLoading = false }

        do {

            let questionModels: QuestionModels = try await NetworkManager.shared.fetchData(endpoint: .getQuestions)
            self.questionResult = questionModels

            let categoryModel: CategoryModel = try await NetworkManager.shared.fetchData(endpoint: .getCategories)
            self.categoryResult = categoryModel

        } catch {
            print("Error occurred: \(error)")
        }
    }

    func loadDataConcurrent() async {
        isLoading = true
        defer { isLoading = false }

        do {
            async let questionModels: QuestionModels = NetworkManager.shared.fetchData(endpoint: .getQuestions)
            async let categoryModel: CategoryModel = NetworkManager.shared.fetchData(endpoint: .getCategories)

            self.questionResult = try await questionModels
            self.categoryResult = try await categoryModel

        } catch {
            print("Error occurred: \(error)")
        }
    }
}
