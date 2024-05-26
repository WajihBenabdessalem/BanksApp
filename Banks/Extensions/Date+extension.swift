//
//  Date+extension.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import Foundation

extension Date {
    /// Convert the date to a string date.
    ///
    /// - Returns: A string type of the date in "dd/MM/yyyy" format .
    func to_DD_MM_YYYY_Format() -> String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy"
        return formatDate.string(from: self)
    }
}
