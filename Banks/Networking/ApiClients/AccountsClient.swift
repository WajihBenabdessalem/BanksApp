//
//  AccountsClient.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import Foundation

protocol AccountsService {
    func fetchAccounts() async throws -> AccountsResponse
}

class AccountsClient: AccountsService {
    func fetchAccounts() async throws -> AccountsResponse {
        let accounts: AccountsResponse = try await ApiClient.shared.request(
            endPoint: AccountsEndPoint.accounts
        )
        return accounts
    }
}
