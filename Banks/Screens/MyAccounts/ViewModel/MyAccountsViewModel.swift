//
//  MyAccountsViewModel.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import Foundation

class MyAccountsViewModel: ObservableObject {
    
    @Published var caAccounts: [Accounts] = []
    @Published var otherAccounts: [Accounts] = []

    let accountsService: AccountsService
    
    init(accountsService: AccountsService) {
        self.accountsService = accountsService
    }

    func fetchAccounts() async {
        do {
            let fetchedAccounts = try await accountsService.fetchAccounts()
            await MainActor.run {
                caAccounts = fetchedAccounts.filter({ bank in bank.isCA == 1 })
                otherAccounts = fetchedAccounts.filter({ bank in bank.isCA == 0 })
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
}
