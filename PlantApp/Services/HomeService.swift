//
//  HomeService.swift
//  PlantApp
//
//  Created by Mine Rala on 27.03.2025.
//

import Foundation

protocol HomeServiceProtocol {
    func fetchQuestions() async throws -> QuestionModels
    func fetchCategories() async throws -> CategoryModel
}

struct HomeService: HomeServiceProtocol {
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient = NetworkManager()) {
        self.networkClient = networkClient
    }

    func fetchQuestions() async throws -> QuestionModels {
        return try await networkClient.fetch(endpoint: Endpoint.getQuestions)
    }

    func fetchCategories() async throws -> CategoryModel {
        return try await networkClient.fetch(endpoint: Endpoint.getCategories)
    }
}
