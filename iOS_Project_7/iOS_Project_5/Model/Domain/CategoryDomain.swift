//
//  CategoryDomain.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 11/01/2024.
//

import Foundation
import CoreData

struct CategoryDomain: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case name
        case items
    }
    
    let name: String
    let items: Array<ItemDomain>
}

extension CategoryDomain {
    func mapToDB(context: NSManagedObjectContext) -> Category {
        let category = Category(context: context)
        category.name = self.name
        
        self.items.forEach { item in
            let mappedItem = item.mapToDB(context: context)
            
            category.addToItems(mappedItem)
        }
        
        return category
    }
}
