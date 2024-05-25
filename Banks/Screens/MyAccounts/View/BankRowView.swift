//
//  BankRowView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import SwiftUI

struct BankRowView: View {
    
    let title: String
    let accounts: [Account]
    
    var body: some View {
        Section {
            DisclosureGroup {
                Group {
                    ForEach(accounts, id: \.id) { account in
                        BankItemView(title: account.label, 
                                     price: "\(account.balance) €")
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
#if DEBUG
#Preview {
    BankRowView(title: "Account title", accounts: [])
        .padding(.horizontal)
}
#endif
