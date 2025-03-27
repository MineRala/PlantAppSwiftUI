//
//  AppError.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

enum AppError: Error {
    case invalidURL
    case invalidResponse
    case invalidRequest
    case invalidData
    case invalidHTTPStatusCode(statusCode: Int)
    case networkError(Error)
    case decodingError
    case unauthorized
    case paymentRequired
    case pageNotFound
    case noInternetConnection
    case unknown

    var errorMessage: String {
        switch self {
        case .invalidURL:
            return AppString.invalidURL.localized
        case .invalidResponse:
            return AppString.invalidResponse.localized
        case .invalidRequest:
            return AppString.invalidRequest.localized
        case .invalidData:
            return AppString.invalidData.localized
        case .invalidHTTPStatusCode(let statusCode):
            return AppString.invalidHTTPStatusCode.localized + "\(statusCode)"
        case .networkError(let error):
            return AppString.networkError.localized
        case .decodingError:
            return AppString.decodingError.localized
        case .unauthorized:
            return AppString.unauthorized.localized
        case .paymentRequired:
            return AppString.paymentRequired.localized
        case .pageNotFound:
            return AppString.pageNotFound.localized
        case .noInternetConnection:
            return AppString.noInternetConnection.localized
        case .unknown:
            return AppString.unowned.localized
        }
    }
}
