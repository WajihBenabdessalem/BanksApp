//
//  ContentView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var coordinator: Coordinator
    @State var selectedTabIndex: Int
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            ForEach(Tab.allCases) { tab in
                NavigationStack(path: $coordinator.path) {
                    switch tab {
                    case .myAccounts:
                        coordinator.build(page: .accounts)
                            .navigationDestination(for: Page.self) { page in
                                coordinator.build(page:page)
                            }
                    case .simulation:
                        coordinator.build(page: .simulation)
                    case .upToYou:
                        coordinator.build(page: .upToYou)
                    }
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.systemImage)
                }
            }
        }
    }
}

extension ContentView {
    /// An enumeration that represents the different tabs in an application.
    /// It conforms to `CaseIterable`,`Identifiable` and `Hashable`, allowing for iteration
    /// over all possible cases and providing a unique identifier for each case.
    enum Tab: Int, CaseIterable, Identifiable, Hashable {
        /// Represents "Mes Comptes" screen
        case myAccounts
        /// Represents the "Simulation" screen
        case simulation
        /// Represents the " À vous de jouer" screen
        case upToYou

        /// The unique identifier for each case, derived from the rawValue of the enumeration.
        var id: Int { self.rawValue }
        /// A computed property that returns the title associated with tab.
        var title: String {
            switch self {
            case .myAccounts: return AppString.myAccounts
            case .simulation: return AppString.simulation
            case .upToYou: return AppString.upToYou
            }
        }
        /// A computed property that returns the system image name associated with tab.
        /// These image name correspond to SF Symbols and can be used as icon for the tab.
        var systemImage: String {
            switch self {
            case .myAccounts: return "star.fill"
            case .simulation: return "gear"
            case .upToYou: return "flag"
            }
        }
    }
}

// MARK: - Previews
#Preview {
    NavigationStack {
        ContentView(selectedTabIndex: 0)
    }
}
