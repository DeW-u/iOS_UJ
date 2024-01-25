//
//  AuthDomain.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 14/01/2024.
//

import Foundation
import CoreData

struct AuthDomain: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
    
    let username: String
    let password: String
}
