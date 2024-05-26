//
//  AccountRowView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/24/24.
//

import SwiftUI

struct AccountRowView: View {
    
    let title: String
    let amount: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)
                .padding(.leading)
            Spacer()
            Text(amount)
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
    AccountRowView(title: MockData.operation1.title,
                 amount: MockData.operation1.amount)
}
