//
//  ItemDomain.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 11/01/2024.
//

import Foundation
import CoreData

struct ItemDomain: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case name
        case desc
        case price
    }
    
    let name: String
    let desc: String
    let price: Double
}

extension ItemDomain {
    func mapToDB(context: NSManagedObjectContext) -> Item {
        let item = Item(context: context)
        
        item.name = self.name
        item.desc = self.desc
        item.price = self.price
        
        return item
    }
}
