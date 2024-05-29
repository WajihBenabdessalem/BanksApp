//
//  RootViewUITests.swift
//  BanksUITests
//
//  Created by Wajih Benabdessalem on 5/28/24.
//

import XCTest

final class RootViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testTabViewSelection() throws {
        /// Ensure the TabView exists and interact with it
        
        let accountsTab = app.tabBars.buttons["Mes Comptes"]
        let simulationTab = app.tabBars.buttons["Simulation"]
        let upToYouTab = app.tabBars.buttons["À vous de jouer"]
        
        XCTAssertTrue(accountsTab.exists, "The Accounts tab should exist")
        XCTAssertTrue(simulationTab.exists, "The Simulation tab should exist")
        XCTAssertTrue(upToYouTab.exists, "The Up To You tab should exist")
        
        /// Select the Accounts tab
        accountsTab.tap()
        XCTAssertTrue(app.navigationBars["Mes Comptes"].exists, "The Accounts screen should be displayed")
        
        /// Select the Simulation tab
        simulationTab.tap()
        XCTAssertTrue(app.navigationBars["Simulation"].exists, "The Simulation screen should be displayed")
        
        /// Select the Up To You tab
        upToYouTab.tap()
        XCTAssertTrue(app.navigationBars["À vous de jouer"].exists, "The Up To You screen should be displayed")
    }
}
