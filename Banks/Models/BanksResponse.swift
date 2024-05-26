//
//  BanksResponse.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/23/24.
//

import Foundation

typealias AccountsResponse = [Accounts]

// MARK: - Accounts
struct Accounts: Codable, Equatable, Hashable {
    let accounts: [Account]
    let isCA: Int
    let name: String
}

// MARK: - Account
struct Account: Codable, Identifiable, Equatable, Hashable {
    let balance: Double
    let contractNumber, holder, id, label: String
    let operations: [Operation]
    let order: Int
    let productCode: String
    let role: Int

    enum CodingKeys: String, CodingKey {
        case balance
        case contractNumber = "contract_number"
        case holder, id, label, operations, order
        case productCode = "product_code"
        case role
    }
}

extension Account {
    var accountBalance: String {
        String(balance)+" €"
    }
}

// MARK: - Operation
struct Operation: Codable, Identifiable, Equatable, Hashable {
    let amount, category, date, id: String
    let title: String
}

extension Operation {
    var operationDate: String {
        if let timeInterval = TimeInterval(date) {
            return Date(timeIntervalSince1970: timeInterval).to_DD_MM_YYYY_Format()
        }
        return Date().to_DD_MM_YYYY_Format()
    }
    var operationAmount: String {
        amount+" €"
    }
}
