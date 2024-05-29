//
//  CoordinatorTests.swift
//  BanksTests
//
//  Created by Wajih Benabdessalem on 5/28/24.
//

import XCTest
import SwiftUI
import Combine

@testable import Banks

final class CoordinatorTests: XCTestCase {
    var coordinator: Coordinator!
    var cancellables: Set<AnyCancellable>!

    let account = MockData.account1

    override func setUpWithError() throws {
        coordinator = Coordinator()
        cancellables = []
    }

    override func tearDownWithError() throws {
        coordinator = nil
        cancellables = nil
    }

    func testPush() {
        // Given
        let expectation = XCTestExpectation(description: "Coordinator pushes a new page")

        // When
        coordinator.push(.detail(account))

        // Then
        coordinator.$currentPage
            .sink { [self] currentPage in
                if currentPage == .detail(account) {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testPop() {
        // Given
        coordinator.push(.detail(account))
        let expectation = XCTestExpectation(description: "Coordinator pops to previous view")

        // When
        coordinator.pop()

        // Then
        coordinator.$path
            .sink { path in
                if path.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    
    func testPopToRoot() {
        // Given
        coordinator.push(.detail(account))
        coordinator.push(.accounts)
        let expectation = XCTestExpectation(description: "Coordinator pops to root")

        // When
        coordinator.popToRoot()

        // Then
        coordinator.$path
            .sink { path in
                if path.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
