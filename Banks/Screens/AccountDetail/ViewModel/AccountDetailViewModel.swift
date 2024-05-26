//
//  AccountDetailViewModel.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import Foundation

class AccountDetailViewModel: ObservableObject {
    
    @Published var account: Account
    @Published var operations: [Operation] = []

    init(account: Account) {
        self.account = account
        self.sortOperationList()
    }
    
    func sortOperationList() {
        self.operations = account.operations.sorted {
            if let date1 = $0.operationDate.toDate(),
                let date2 = $1.operationDate.toDate() {
                return date1 > date2
            }
            return false
        }
    }
}
