//
//  ApiErrorMessageDomain.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 24/01/2024.
//

import Foundation

struct ApiErrorMessageDomain: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case error
    }
    
    let error: String
}
