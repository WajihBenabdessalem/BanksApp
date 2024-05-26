//
//  BankItemView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import SwiftUI

struct BankItemView: View {
    
    let title: String
    let price: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)
                .padding(.leading)
            Spacer()
            Text(price)
                .font(.headline)
                .foregroundStyle(.gray.opacity(0.5))
                .padding(.trailing)
            Image(systemName: "chevron.forward")
                .foregroundStyle(.gray.opacity(0.5))
        }
        .padding(.horizontal)
    }
}
// MARK: - Previews
#Preview {
    BankItemView(title: "Account title", price: "12345.67 €")
}
