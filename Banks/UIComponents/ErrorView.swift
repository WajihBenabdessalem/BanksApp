//
//  ErrorView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/29/24.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let onRetry: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            Text("Oops")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
            Text(errorMessage)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: onRetry) {
                Text("Retry")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    ErrorView(errorMessage: AppString.errorMessage, onRetry: {
        print("Retry button tapped")
    })
}
