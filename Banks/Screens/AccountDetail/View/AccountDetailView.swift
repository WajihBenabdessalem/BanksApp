//
//  AccountDetailView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import SwiftUI

struct AccountDetailView: View {

    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel: AccountDetailViewModel
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text(viewModel.account.accountBalance)
                    .font(.largeTitle)
                    .accessibilityIdentifier("accountBalance")
                Text(viewModel.account.label)
                    .font(.title3)
                    .accessibilityIdentifier("accountLabel")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            List {
                ForEach(viewModel.operations, id: \.id) { operation in
                    OperationRowView(operation: operation)
                        .accessibilityIdentifier("operationRow_\(operation.id)")
                }
            }
            .id(UUID())
            .listStyle(.plain)
            .accessibilityIdentifier("operationsList")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//// MARK: - Previews
#Preview {
    NavigationStack {
        AccountDetailView(viewModel: AccountDetailViewModel(account: MockData.account1))
    }
}
