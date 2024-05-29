//
//  APIClientTests.swift
//  BanksTests
//
//  Created by Wajih Benabdessalem on 5/28/24.
//

import XCTest
@testable import Banks

final class APIClientTests: XCTestCase {

    var mockApiClient: MockApiClient!
    
    override func setUpWithError() throws {
        mockApiClient = MockApiClient()
    }

    override func tearDownWithError() throws {
        mockApiClient = nil
    }

    func testRequestSuccess() async throws {
        // Given
        let expectedData = AccountsResponse()
        let data = try! JSONEncoder().encode(expectedData)
        mockApiClient.result = .success(data)

        // When
        let result: AccountsResponse = try await mockApiClient.request(endPoint: MockEndPoint.validURL)

        // Then
        XCTAssertEqual(result, expectedData)
    }

    func testRequestFailure() async throws {
        // Given
        let expectedError = ApiError.invalidURL
        mockApiClient.result = .failure(expectedError)

        // When & Then
        do {
            let _: AccountsResponse = try await mockApiClient.request(endPoint: MockEndPoint.invalidURL)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual(error as! ApiError, expectedError)
        }
    }

}
