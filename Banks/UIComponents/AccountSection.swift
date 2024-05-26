//
//  AccountSection.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import SwiftUI

struct AccountSection: View {
    
    let header: String
    let accounts: [Accounts]
    let action: (Account) -> Void

    var body: some View {
        Section(header:
            Text(header)
             .foregroundStyle(.gray)
             .padding(.leading,-16)
        ) {
            ForEach(accounts, id: \.name) { bank in
                BankAccountRowView(title: bank.name,
                            accounts: bank.accounts){ account in action(account)
                }
            }
        }
        .headerProminence(.increased)
    }
}

// MARK: - Previews
#Preview {
    AccountSection(header: AppString.caAccount,
                   accounts: [],
                   action: {_ in})
}
