//
//  MockData.swift
//  Banks
//
//  Created by Wajih Benabdessalem on 5/25/24.
//

import Foundation

struct MockData {
    static let account1 = Account(balance: 2031.84,
                                 contractNumber: "32216549871",
                                 holder: "Corinne Martin",
                                 id: "151515151151",
                                 label: "Compte de dépôt",
                                 operations: [
                                    operation1, operation2
                                 ],
                                 order: 1,
                                 productCode: "00004",
                                 role: 1)
    static let account2 = Account(balance: 843.15,
                                 contractNumber: "09320939231",
                                 holder: "M. et Mme Martin",
                                 id: "9892736780987654",
                                 label: "Compte joint",
                                 operations: [
                                    operation1, operation2
                                 ],
                                 order: 2,
                                 productCode: "00007",
                                 role: 2)
    static let operation1 = Operation(amount: "-15,99",
                                     category: "leisure",
                                     date: "1644870724",
                                     id: "2",
                                     title: "Prélèvement Netflix")
    static let operation2 = Operation(amount: "-95,99",
                                     category: "online",
                                     date: "1644611558",
                                     id: "4",
                                     title: "CB Amazon")
    static let accounts = [account1, account2]
}
