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

    var body: some View {
        Section(header:
            Text(header)
             .foregroundStyle(.gray)
             .padding(.leading,-16)
        ) {
            ForEach(accounts, id: \.name) { bank in
                BankRowView(title: bank.name, accounts: bank.accounts)
            }
        }
        .headerProminence(.increased)
    }
}

// MARK: - Previews
#if DEBUG
#Preview {
    AccountSection(header: "Credit Agricole", accounts: [])
}
#endif
