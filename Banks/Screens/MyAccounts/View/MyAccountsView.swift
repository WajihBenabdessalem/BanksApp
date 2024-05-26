//
//  MyAccountsView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/23/24.
//

import SwiftUI

struct MyAccountsView: View {
    
    @StateObject var viewModel: MyAccountsViewModel

    var body: some View {
        List {
            AccountSection(header: AppString.caAccount,
                           accounts: viewModel.caAccounts){ account in
                viewModel.showAccountDetail(account: account)
            }
            AccountSection(header: AppString.otherAccount,
                           accounts: viewModel.otherAccounts){ account in
                viewModel.showAccountDetail(account: account)
            }
        }
        .listStyle(.sidebar)
        .task {
            await viewModel.fetchAccounts()
        }
    }
}

// MARK: - Previews
#Preview {
    NavigationStack {
        MyAccountsView(
            viewModel: MyAccountsViewModel(
                coordinator: Coordinator(),
                accountsService: AccountsClient()
            )
        )
    }
}
