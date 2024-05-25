//
//  ContentView.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTabIndex: Int
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            ForEach(Tab.allCases) { tab in
                NavigationStack {
                    switch tab {
                    case .myAccounts:
                        MyAccountsView()
                            .navigationTitle(tab.title)
                    case .simulation:
                        SimulationView()
                            .navigationTitle(tab.title)
                    case .upToYou:
                        UpToYouView()
                            .navigationTitle(tab.title)
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
            case .myAccounts:
                return "Mes Comptes"
            case .simulation:
                return "Simulation"
            case .upToYou:
                return "À vous de jouer"
            }
        }
        
        /// A computed property that returns the system image name associated with tab.
        /// These image name correspond to SF Symbols and can be used as icon for the tab.
        var systemImage: String {
            switch self {
            case .myAccounts:
                return "star.fill"
            case .simulation:
                return "gear"
            case .upToYou:
                return "flag"
            }
        }
    }
}

// MARK: - Previews
#if DEBUG
#Preview {
    ContentView(selectedTabIndex: 0)
}
#endif
