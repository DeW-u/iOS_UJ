//
//  CreditCardDomain.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 23/01/2024.
//

import Foundation

struct CreditCardDomain: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case cardNumber
        case expirationDate
        case cvvCode
        case ownerFirstName
        case ownerLastName
    }
    
    let cardNumber: String
    let expirationDate: String
    let cvvCode: String
    let ownerFirstName: String
    let ownerLastName: String
}
