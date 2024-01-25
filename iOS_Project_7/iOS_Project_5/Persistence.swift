//
//  Persistence.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 09/01/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "iOS_Project_5")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
//        var isEmpty: Bool {
//            do {
//                let isEmpty = try container.viewContext.fetch(Category.fetchRequest()).isEmpty
//
//                return isEmpty
//            } catch let error as NSError {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//
//        if isEmpty {
//            prepopulate(viewContext: container.viewContext)
//        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
//    func prepopulate(viewContext: NSManagedObjectContext) {
//        let meatCategory = Category(context: viewContext)
//        meatCategory.name = "Meats"
//
//        let dairyCategory = Category(context: viewContext)
//        dairyCategory.name = "Dairy"
//
//        let sweetsCategory = Category(context: viewContext)
//        sweetsCategory.name = "Sweets"
//
//        for index in 1...3 {
//            let newMeatItem = Item(context: viewContext)
//            newMeatItem.name = "Chicken #\(index)"
//            newMeatItem.desc = "It's chicken no. \(index)"
//            newMeatItem.price = Double(index) + 9.99
//            meatCategory.addToItems(newMeatItem)
//
//            let newDairyItem = Item(context: viewContext)
//            newDairyItem.name = "Milk #\(index)"
//            newDairyItem.desc = "It's milk no. \(index)"
//            newDairyItem.price = Double(index) + 4.99
//            dairyCategory.addToItems(newDairyItem)
//
//            let newSweetsItem = Item(context: viewContext)
//            newSweetsItem.name = "Candy #\(index)"
//            newSweetsItem.desc = "It's candy no. \(index)"
//            newSweetsItem.price = Double(index) + 0.99
//            sweetsCategory.addToItems(newSweetsItem)
//        }
//
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
    
    //MARK: Operations
    func clearCart() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "inCart > 0")
        
        var fetchedItems: [Item]
        
        do {
            fetchedItems = try container.viewContext.fetch(request)
            
            fetchedItems.forEach { item in
                item.inCart = 0
            }
            
            try container.viewContext.save()
        } catch let error {
            print("Fetch error: \(error)\n Persistance - clearCart() error")
        }
    }
    
    func addItemToCart(item: Item) {
        item.inCart += 1
        
        do {
            try container.viewContext.save()
        } catch {
            print("Saving error: \(error)\nPersistance - addItemToCart(item: Item) error")
        }
    }
    
    //MARK: Preview
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let meatCategory = Category(context: viewContext)
        meatCategory.name = "Meats"
        
        let dairyCategory = Category(context: viewContext)
        dairyCategory.name = "Dairy"
        
        let sweetsCategory = Category(context: viewContext)
        sweetsCategory.name = "Sweets"
        
        for index in 1...3 {
            let newMeatItem = Item(context: viewContext)
            newMeatItem.name = "Chicken #\(index)"
            newMeatItem.desc = "It's chicken no. \(index)"
            newMeatItem.price = Double(index) + 9.99
            meatCategory.addToItems(newMeatItem)
            
            let newDairyItem = Item(context: viewContext)
            newDairyItem.name = "Milk #\(index)"
            newDairyItem.desc = "It's milk no. \(index)"
            newDairyItem.price = Double(index) + 4.99
            dairyCategory.addToItems(newDairyItem)
            
            let newSweetsItem = Item(context: viewContext)
            newSweetsItem.name = "Candy #\(index)"
            newSweetsItem.desc = "It's candy no. \(index)"
            newSweetsItem.price = Double(index) + 0.99
            sweetsCategory.addToItems(newSweetsItem)
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
