//
//  CoreDataTests.swift
//  iOS_Project_Tests
//
//  Created by Daniel Latos on 26/01/2024.
//

import XCTest
@testable import iOS_Project_5
import CoreData

final class CoreDataTests: XCTestCase {

    let persistancePreview = PersistenceController.preview
    
    func testPopulateItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        
        do {
            let items = try persistancePreview.container.viewContext.fetch(request)
            
            XCTAssertGreaterThan(items.count, 0)
        } catch {
            
        }
    }

    func testPopulateCategories() {
        let request = Category.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        
        do {
            let categories = try persistancePreview.container.viewContext.fetch(request)
            
            XCTAssertGreaterThan(categories.count, 0)
        } catch {
            
        }
    }
    
    func testInsertItem() {
        let context = persistancePreview.container.viewContext
        
        do {
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
            
            let oldItemsCount = try persistancePreview.container.viewContext.fetch(request).count
            
            let meatCategory = Category(context: context)
            meatCategory.name = "Meats"
            
            let newItem = Item(context: context)
            newItem.name = "Test Chicken #\(1)"
            newItem.desc = "It's test chicken no. \(1)"
            newItem.price = Double(9.99) + 9.99
            meatCategory.addToItems(newItem)
            
            let newItemsCount = try persistancePreview.container.viewContext.fetch(request).count
            
            XCTAssertEqual(newItemsCount, oldItemsCount+1)
        } catch {
            
        }
    }
    
    func testInsertCategory() {
        let context = persistancePreview.container.viewContext
        
        do {
            let request = Category.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
            
            let oldCategoryCount = try persistancePreview.container.viewContext.fetch(request).count
            
            let testCategory = Category(context: context)
            testCategory.name = "Test Category"
            
            let newCategoryCount = try persistancePreview.container.viewContext.fetch(request).count
            
            XCTAssertEqual(newCategoryCount, oldCategoryCount+1)
        } catch {
            
        }
    }
    
    func testInsertToCart() {
        do {
            let requestItem: NSFetchRequest<Item> = Item.fetchRequest()
            requestItem.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
            
            let exampleItem = try persistancePreview.container.viewContext.fetch(requestItem).first
            
            persistancePreview.addItemToCart(item: exampleItem!)
            
            let requestCart: NSFetchRequest<Item> = Item.fetchRequest()
            requestCart.predicate = NSPredicate(format: "inCart > 0")
            requestCart.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
            
            let fetchedCart = try persistancePreview.container.viewContext.fetch(requestCart).count
            
            XCTAssertGreaterThan(fetchedCart, 0)
        } catch {
            
        }
    }
    
    func testClearCart() {
        do {
            let requestCart: NSFetchRequest<Item> = Item.fetchRequest()
            requestCart.predicate = NSPredicate(format: "inCart > 0")
            requestCart.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
            
            let fetchedCartOldCount = try persistancePreview.container.viewContext.fetch(requestCart).count
            
            persistancePreview.clearCart()
            
            let fetchedCartNewCount = try persistancePreview.container.viewContext.fetch(requestCart).count
            
            XCTAssertLessThanOrEqual(fetchedCartNewCount, fetchedCartOldCount)
        } catch {
            
        }
    }
}
