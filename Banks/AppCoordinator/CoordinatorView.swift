//
//  CoordinatorView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/27/24.
//

import SwiftUI

struct CoordinatorView: View {

    @StateObject private var coordinator = Coordinator()

    var body: some View {
        coordinator.build(page: .root)
            .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
