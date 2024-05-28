//
//  AccountsEndPoint.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import Foundation

enum AccountsEndPoint {
    case accounts
}

extension AccountsEndPoint: EndPoint {
    var path: String {
        switch self {
        case .accounts:
            "/banks.json"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .accounts:
            .get
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .accounts:
            []
        }
    }
}
