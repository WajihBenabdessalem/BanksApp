//
//  BanksResponse.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/23/24.
//


import Foundation

typealias AccountsResponse = [Accounts]

// MARK: - Accounts
struct Accounts: Codable {
    let accounts: [Account]
    let isCA: Int
    let name: String
}

// MARK: - Account
struct Account: Codable {
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

// MARK: - Operation
struct Operation: Codable {
    let amount, category, date, id: String
    let title: String
}
