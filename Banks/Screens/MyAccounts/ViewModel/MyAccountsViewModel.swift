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
    private var coordinator: Coordinator
    
    let accountsService: AccountsService
    
    init(coordinator: Coordinator,
         accountsService: AccountsService) {
        self.coordinator = coordinator
        self.accountsService = accountsService
    }
    
    @MainActor
    func fetchAccounts() async {
        do {
            let fetchedAccounts = try await accountsService.fetchAccounts()
            caAccounts = fetchedAccounts
                .filter({ bank in bank.isCA == 1 })
                .sorted { $0.name.lowercased() < $1.name.lowercased() }
            otherAccounts = fetchedAccounts
                .filter({ bank in bank.isCA == 0 })
                .sorted { $0.name.lowercased() < $1.name.lowercased() }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func showAccountDetail(account: Account) {
        coordinator.showAccountDetail(account: account)
    }
}
