//
//  Endpoint.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

//https://dummy-api-jtg6bessta-ey.a.run.app/getCategories
//https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions

public enum Endpoint {
    enum Constant {
        static let baseURL = "https://dummy-api-jtg6bessta-ey.a.run.app/"
    }

    case getQuestions
    case getCategories

    var url: String {
        switch self {
        case .getQuestions:
            return "\(Constant.baseURL)getQuestions"
        case .getCategories:
            return "\(Constant.baseURL)getCategories"
        }
    }
}
