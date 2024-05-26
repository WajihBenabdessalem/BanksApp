//
//  OperationRowView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import SwiftUI

struct OperationRowView: View {
    
    let operation: Operation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(operation.title)
                Text(operation.operationDate)
            }
            Spacer()
            Text(operation.operationAmount)
                .foregroundStyle(.gray)
        }
    }
}

// MARK: - Previews
#Preview {
    OperationRowView(operation: MockData.operation1).padding(.horizontal)
}
