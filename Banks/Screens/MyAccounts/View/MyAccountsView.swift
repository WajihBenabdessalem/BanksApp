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
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .accessibilityIdentifier("ProgressView")
            case .failed(let error):
                ErrorView(errorMessage: error) {
                    Task{await viewModel.fetchAccounts()}
                }.accessibilityIdentifier("ErrorView")
            case .loaded((let caAccounts,let otherAccounts)):
                List {
                    AccountSection(
                        header: AppString.caAccount,
                        accounts: caAccounts
                    ) { account in
                        coordinator.push(.detail(account))
                    }
                    .accessibilityIdentifier("caAccountSection")
                    AccountSection(
                        header: AppString.otherAccount,
                        accounts: otherAccounts
                    ) { account in
                        coordinator.push(.detail(account))
                    }
                    .accessibilityIdentifier("otherAccountSection")
                }
                .id(UUID())
                .listStyle(.insetGrouped)
            }
        }.task {
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
