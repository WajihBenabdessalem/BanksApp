//
//  BankAccountRowView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import SwiftUI

struct BankAccountRowView: View {
    
    let title: String
    let accounts: [Account]
    let action: (Account) -> Void

    var body: some View {
        Section {
            DisclosureGroup {
                Group {
                    ForEach(accounts, id: \.id) { account in
                        Button {
                            action(account)
                        } label: {
                            AccountRowView(title: account.label,
                                         amount: account.accountBalance)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            } label: {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black.opacity(0.7))
            }
            .tint(Color.black.opacity(0.5))
        }
    }
}

// MARK: - Previews
#Preview {
    BankAccountRowView(title: MockData.account1.label,
                accounts: MockData.accounts,
                action: { account in })
        .padding(.horizontal)
}
