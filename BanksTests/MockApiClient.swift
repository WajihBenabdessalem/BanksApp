//
//  MockApiClient.swift
//  BanksTests
//
//  Created by Wajih Benabdessalem on 5/28/24.
//

import Foundation

class MockApiClient: ApiService {
    
    var result: Result<Data, Error>?

    func request<T: Decodable>(endPoint: EndPoint) async throws -> T {
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        case .failure(let error):
            throw error
        case .none:
            fatalError("Result not set")
        }
    }
}
