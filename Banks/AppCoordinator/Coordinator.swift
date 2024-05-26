//
//  Coordinator.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/26/24.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()

    func showAccountDetail(account: Account) {
        path.append(account)
    }

    func goBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}
