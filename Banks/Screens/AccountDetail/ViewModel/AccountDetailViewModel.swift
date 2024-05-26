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
    
    /// If two operations have the same date, we will display them in alphabetical order..
    func sortOperationList() {
        let customSortingClosure: (Operation, Operation) -> Bool = { op1, op2 in
            if let date1 = op1.operationDate.toDate(),
               let date2 = op2.operationDate.toDate() {
                if date1 != date2 {
                    return date1 > date2
                } else {
                    return op1.title < op2.title
                }
            }
            return false
        }
        self.operations = account.operations.sorted(by: customSortingClosure)
    }
}
