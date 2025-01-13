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

    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidRequest:
            return "Invalid Request"
        case .invalidData:
            return "The data received from the server was invalid. Please try again."
        case .invalidHTTPStatusCode(let statusCode):
            return "Invalid HTTP Status Code: \(statusCode)"
        case .networkError(let error):
            return "A network error has occurred. Check your Internet connection and try again."
        case .decodingError:
            return "Decoding Error"
        case .unauthorized:
            return "In order to perform this operation, you must be logged in or have the necessary authorization. Please log in or provide the necessary authorization."
        case .paymentRequired:
            return "Sorry, you need to pay to view or access this content."
        case .pageNotFound:
            return "Sorry, the page or resource you requested could not be found. Please check the URL or try again later."
        case .noInternetConnection:
            return "Sorry, there is no internet connection. Please check your internet connection and try again."
        }
    }
}
