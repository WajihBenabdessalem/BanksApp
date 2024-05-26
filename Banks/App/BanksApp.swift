//
//  BanksApp.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/22/24.
//

import SwiftUI

@main
struct BanksApp: App {
    
    @StateObject private var coordinator = Coordinator()

    var body: some Scene {
        WindowGroup {
            ContentView(selectedTabIndex: 0)
                .environmentObject(coordinator)
        }
    }
}
