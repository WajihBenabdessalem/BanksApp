//
//  Coordinator.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/27/24.
//

import SwiftUI

enum Page: Hashable {
    case root
    case accounts
    case detail(Account)
    case simulation
    case upToYou
}

enum Sheet: String, Identifiable {
    case pickerView

    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case operationView

    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {

    @Published var path = NavigationPath()

    func push(_ page: Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .root:
            ContentView( selectedTabIndex: 0)
        case let .detail(account):
            AccountDetailView(viewModel: AccountDetailViewModel(account: account))
        case .accounts:
            MyAccountsView(viewModel: MyAccountsViewModel(accountsService: AccountsClient()))
                .navigationTitle(AppString.myAccounts)
        case .simulation:
            SimulationView()
                .navigationTitle(AppString.simulation)
        case .upToYou:
            UpToYouView()
                .navigationTitle(AppString.upToYou)
        }
    }
}
