//
//  String+extension.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import Foundation

extension String {
    /// Convert the string date to date.
    /// 
    /// - Returns: The date format of the string date in "dd/MM/yyyy" format .
   public func toDate() -> Date? {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy"
        return formatDate.date(from: self)
    }
}
