//
//  APIService.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    func fetchData<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = URL(string: endpoint.url) else {
            throw AppError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw AppError.invalidResponse
            }

            switch httpResponse.statusCode {
            case 200...299:
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    print("Decoding Error: \(error)")
                    throw AppError.decodingError
                }
            case 400:
                throw AppError.invalidRequest
            case 401:
                throw AppError.unauthorized
            case 402:
                throw AppError.paymentRequired
            case 404:
                throw AppError.pageNotFound
            default:
                throw AppError.invalidHTTPStatusCode(statusCode: httpResponse.statusCode)
            }
        } catch let error as NSError {
            if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                throw AppError.noInternetConnection
            } else {
                throw error
            }
        }
    }
}
