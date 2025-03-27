//
//  NetworkManager.swift
//  PlantApp
//
//  Created by Mine Rala on 20.12.2024.
//

import Foundation

// MARK: - NetworkClient Protocol
protocol NetworkClient {
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T
}

// MARK: - NetworkManager
final class NetworkManager: NetworkClient {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
    }

    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        do {
            let request = try buildRequest(from: endpoint)
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw AppError.invalidResponse
            }

            try validateStatusCode(httpResponse.statusCode)
            return try decoder.decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            throw AppError.decodingError
        } catch let error as URLError {
            throw AppError.networkError(error)
        } catch {
            throw AppError.unknown
        }
    }
}

// MARK: - Private Methods
extension NetworkManager {
    private func buildRequest(from endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            throw AppError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        switch endpoint.encoding {
        case .urlEncoding:
            if let parameters = endpoint.parameters {
                var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path)
                urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                request.url = urlComponents?.url
            }
        case .jsonEncoding:
            if let parameters = endpoint.parameters {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }

        return request
    }

    private func validateStatusCode(_ code: Int) throws {
        switch code {
        case 200...299: return
        case 400: throw AppError.invalidRequest
        case 401: throw AppError.unauthorized
        case 404: throw AppError.pageNotFound
        default: throw AppError.invalidHTTPStatusCode(statusCode: code)
        }
    }
}
