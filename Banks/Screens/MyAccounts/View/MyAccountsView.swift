//
//  MyAccountsView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/23/24.
//

import SwiftUI

struct MyAccountsView: View {
    
    @StateObject var viewModel = MyAccountsViewModel(accountsService: AccountsClient())

    var body: some View {
        List {
            AccountSection(header: "Credit Agricole", 
                           accounts: viewModel.caAccounts)
            AccountSection(header: "Autres Banques",
                           accounts: viewModel.otherAccounts)
        }
        .listStyle(.sidebar)
        .task {
            await viewModel.fetchAccounts()
        }
    }
}

// MARK: - Previews
#if DEBUG
#Preview {
    MyAccountsView(viewModel: MyAccountsViewModel(accountsService: AccountsClient()))
}
#endif
