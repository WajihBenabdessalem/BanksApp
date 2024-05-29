//
//  Data+extension.swift
//  MovieApp
//
//  Created by Wajih Benabdessalem on 5/1/24.
//

import Foundation

public extension Data {
    /// Convert the Data to a JSON string format.
    ///
    /// - Returns: String presenting the json data.
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization
                             .data(withJSONObject: object, options: [.prettyPrinted])
               else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
}
