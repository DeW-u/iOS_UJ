//
//  Requests.swift
//  iOS_Project_3
//
//  Created by Daniel Latos on 09/01/2024.
//

import Foundation
import CoreData

struct Requests {
    
    static func getCartRequest() -> NSFetchRequest<Item> {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "inCart > 0")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        
        return request
    }
}
