//
//  AccountsEndPoint.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import Foundation

enum AccountsEndPoint {
    case myAccounts
}

extension AccountsEndPoint: Endpoint {
    
    var path: String {
        switch self {
        case .myAccounts:
            "/banks.json"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .myAccounts:
            .get
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .myAccounts:
            []
        }
    }
}
