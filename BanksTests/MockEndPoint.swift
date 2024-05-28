//
//  MockEndPoint.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/27/24.
//

import Foundation

enum MockEndPoint {
    case validURL
    case invalidURL
}

extension MockEndPoint: EndPoint {
    var baseURL: URL {
        switch self {
        case .validURL:
            return URL(string: ApiConfig.baseURL)!
        case .invalidURL:
            return URL(string: ApiConfig.mockURL)!
        }
    }
    var headers: [String: String] {
        return [
            "Content-Type": ApiConfig.contentType
         ]
    }
    var path: String {
        switch self {
        case .validURL:
            "/banks.json"
        case .invalidURL:
            "/unKnown_path"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .validURL, .invalidURL:
            .get
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .validURL, .invalidURL:
            []
        }
    }
    var urlRequest: URLRequest {
        var urlComp = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
        urlComp.queryItems = queryItems
        var request = URLRequest(url: urlComp.url!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}
