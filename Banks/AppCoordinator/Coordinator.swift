//
//  Coordinator.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/27/24.
//

import SwiftUI

// MARK: - Page.

enum Page: Hashable {
    case root
    case accounts
    case detail(Account)
    case simulation
    case upToYou
}

// MARK: - Coordinator.

class Coordinator: ObservableObject {

    ///  Pullished variable property wrapper.
    @Published var path = NavigationPath()
    @Published var currentPage: Page = .root
    ///  Method to push the view to the child view.
    func push(_ page: Page) {
        path.append(page)
        currentPage = page
    }
    ///  Method to pop the child view to the parent view.
    func pop() {
        path.removeLast()
    }
    
    ///  Method to pop the view to the root view..
    func popToRoot() {
        path.removeLast(path.count)
        currentPage = .root
    }
    /// Build the view according to the enum `Page`
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .root:
            ContentView()
        case let .detail(account):
            AccountDetailView(viewModel: AccountDetailViewModel(account: account))
        case .accounts:
            MyAccountsView(viewModel: MyAccountsViewModel())
        case .simulation:
            SimulationView()
        case .upToYou:
            UpToYouView()
        }
    }
}
