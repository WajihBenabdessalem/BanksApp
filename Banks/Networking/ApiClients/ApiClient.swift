//
//  ApiClient.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import Foundation

// MARK: - ApiService Protocol.
/// Protocol defining a common interface for making network requests and decoding responses.
protocol ApiService {
    ///  Making
    /// - Parameters:
    ///   - endPoint: Endpoint of type
    ///   - urlSession:  configured Session is an optional
    /// - Returns: returns the decodable of type model
    func request<T: Decodable>(endPoint: Endpoint) async throws -> T
}

// MARK: - ApiClient.
struct ApiClient: ApiService {
    /// Static property for singleton instance.
    static let shared = ApiClient()
    /// Initialisation.
    private init() { }
    /// Default implementation for the request method within the WebService protocol.
    func request<T: Decodable>(endPoint: Endpoint) async throws -> T {
        /// preparing a URLRequest for the provided URL.
        let request = endPoint.urlRequest
        print("Sending request to \(request.url?.absoluteString ?? "")")
        let result: (data: Data?, response: URLResponse) = try await URLSession.shared.data(for: request)
        print("Received response from \(request.url?.absoluteString ?? "")")
        /// Ensuring the response is an HTTPURLResponse and the status code is in the success range.
        guard let response = result.response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        guard (200..<300) ~= response.statusCode else {
            throw ApiError.invalidResponse
        }
        /// Retrieve the data from the response.
        guard let data = result.data else {
            throw ApiError.noResponse
        }
        #if DEBUG
        /// Convert the received data to a JSON string for logging
        if let jsonString = data.prettyJson {
            print("Received Response as JSON:\n\(jsonString)")
        }
        #endif
        do {
            /// decoding data to model with data decoding strategy
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw ApiError.decodingError(description: error.localizedDescription)
        }
    }
}

// MARK: - ApiError.
enum ApiError: Equatable {
    case invalidURL
    case noResponse
    case requestFailed
    case invalidResponse
    case connectionError
    case decodingError(description: String)
    case custom(description: String)
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString(AppString.invalidUrl, comment: "invalidURL")
        case .invalidResponse:
            return NSLocalizedString(AppString.invalidResponse, comment: "invalidResponse")
        case .requestFailed, .noResponse:
            return NSLocalizedString(AppString.requestFailed, comment: "decodingError")
        case .connectionError:
            return NSLocalizedString(AppString.connectionError, comment: "connectionError")
        case .decodingError(let message):
            return NSLocalizedString("Unable to decode \(message)", comment: "decodingError")
        case .custom(description: let description):
            return NSLocalizedString(description, comment: "custom")
        }
    }
}
