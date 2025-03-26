//
//  ViewState.swift
//  PlantApp
//
//  Created by Mine Rala on 26.03.2025.
//

import Foundation

enum ViewState {
    case loading
    case dataLoaded(questions: QuestionModels, categories: [CategoryDataModel])
    case error(message: String)
}
