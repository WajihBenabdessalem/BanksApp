//
//  MyAccountsView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/23/24.
//

import SwiftUI

struct MyAccountsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel: MyAccountsViewModel
    var body: some View {
        List {
            AccountSection(
                header: AppString.caAccount,
                accounts: viewModel.caAccounts
            ) { account in
                coordinator.push(.detail(account))
            }
            AccountSection(
                header: AppString.otherAccount,
                accounts: viewModel.otherAccounts
            ) { account in
                coordinator.push(.detail(account))
            }
        }
        .listStyle(.insetGrouped)
        .task {
            await viewModel.fetchAccounts()
        }
    }
}

// MARK: - Previews
#Preview {
    MyAccountsView(
        viewModel: MyAccountsViewModel(
            accountsService: AccountsClient()
        )
    )
}
