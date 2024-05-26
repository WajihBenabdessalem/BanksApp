//
//  String+extension.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy"
        return formatDate.date(from: self)
    }
}
