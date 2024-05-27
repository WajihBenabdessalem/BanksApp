//
//  EndPoint.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case PATCH = "PATCH"
    case delete = "DELETE"
}

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
    var urlRequest: URLRequest { get }
}

extension Endpoint {

    var baseURL: URL {
        return URL(string: ApiConstants.baseURL)!
    }
    var headers: [String: String] {
        return [
            "Content-Type": ApiConstants.contentType
         ]
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
