# Banks App

iOS Project Template

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

## Description

This is a simple iOS app, providing the best practice of your development skills using:
 - SwiftUI
 - MVVM-C
 - Async/Await
 - Unit Testing

## Table of Contents

- [Installation](#installation)
- [Requirements](#Requirements)
- [Features](#features)
- [Code quality](#CodeQuality)
- [Contact](#contact)

## Installation

To install this project, simply clone the repository and open it in Xcode:

```bash
git clone https://github.com/WajihBenabdessalem/BanksApp.git
```

## Requirements

iOS 17.5+

## Features

#### 1- Networking:

Create the ApiService protocol.

```
// MARK: - ApiService Protocol.
/// Protocol defining a common interface for making network requests and decoding responses.
protocol ApiService {
    ///  Making
    /// - Parameters:
    ///   - endPoint: of type Endpoint
    ///   - urlSession:  configured Session is an optional
    /// - Returns: returns the decodable of type model
    func request<T: Decodable>(endPoint: EndPoint) async throws -> T
}
```
Then we creating an API Client to handle the call requests.
```
// MARK: - ApiClient.
public struct ApiClient: ApiService {
    /// Static property for singleton instance.
    static let shared = ApiClient()
    /// Initialisation.
    private init() { }
    /// Default implementation for the request method within the WebService protocol.
    func request<T: Decodable>(endPoint: EndPoint) async throws -> T {
        /// preparing a URLRequest for the provided URL.
        let request = endPoint.urlRequest
        print("Sending request to \(request.url?.absoluteString ?? "")")
        let result: (data: Data?, response: URLResponse) = try await URLSession.shared.data(for: request)
        print("Received response from \(request.url?.absoluteString ?? "")")
        /// Ensuring the response is an HTTPURLResponse and the status code is in the success range.
        guard let response = result.response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        guard (200..<300) ~= response.statusCode else {
            throw ApiError.invalidResponse
        }
        /// Retrieve the data from the response.
        guard let data = result.data else {
            throw ApiError.noResponse
        }
        #if DEBUG
        /// Convert the received data to a JSON string for logging
        if let jsonString = data.prettyJson {
            print("Received Response as JSON:\n\(jsonString)")
        }
        #endif
        do {
            /// decoding data to model with data decoding strategy
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw ApiError.decodingError(description: error.localizedDescription)
        }
    }
}
```

## Code quality

In this project, i m used the SwiftLint framework for the code quality.
you can install it from the following link:

```bash
https://github.com/realm/SwiftLint.git
```

## Contact

Wajih Benabdessalem - wajih.abdes@gmail.com
