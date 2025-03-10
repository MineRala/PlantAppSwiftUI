//
//  NetworkManager.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

protocol NetworkClient {
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T
}

final class NetworkManager: NetworkClient {
    static let shared = NetworkManager()

    private let session: URLSession
    private let decoder: JSONDecoder
    private let timeoutInterval: TimeInterval = 30

    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = timeoutInterval
        config.timeoutIntervalForResource = timeoutInterval
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]

        self.session = URLSession(configuration: config)
        self.decoder = JSONDecoder()
    }

    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        do {
            guard let url = URL(string: endpoint.url) else {
                throw AppError.invalidURL
            }

            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw AppError.invalidResponse
            }

            try validateStatusCode(httpResponse.statusCode)
            return try decoder.decode(T.self, from: data)
        } catch is DecodingError {
            throw AppError.decodingError
        } catch let error as URLError {
            throw handleURLError(error)
        } catch {
            throw error
        }
    }
}

// MARK: - Private
extension NetworkManager {
    private func validateStatusCode(_ code: Int) throws {
        switch code {
        case 200...299: return
        case 400: throw AppError.invalidRequest
        case 401: throw AppError.unauthorized
        case 404: throw AppError.pageNotFound
        default: throw AppError.invalidHTTPStatusCode(statusCode: code)
        }
    }

    private func handleURLError(_ error: URLError) -> AppError {
        switch error.code {
        case .notConnectedToInternet:
            return .noInternetConnection
        case .timedOut:
            return .invalidResponse
        default:
            return .invalidResponse
        }
    }
}
