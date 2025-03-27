//
//  Endpoint.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

//https://dummy-api-jtg6bessta-ey.a.run.app/getCategories
//https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions

import Foundation

// MARK: - API Endpoint Protocol
protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var encoding: EncodingType { get }
}

// MARK: - APIEndpoint Enum
enum Endpoint: APIEndpoint {
    enum Constant {
        static let baseURL = "https://dummy-api-jtg6bessta-ey.a.run.app/"
    }

    case getQuestions
    case getCategories

    var baseURL: String {
        return Constant.baseURL
    }

    var path: String {
        switch self {
        case .getQuestions:
            return "getQuestions"
        case .getCategories:
            return "getCategories"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var parameters: [String: Any]? {
        return nil
    }

    var encoding: EncodingType {
        return .urlEncoding
    }
}
