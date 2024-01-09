//
//  OrderView.swift
//  iOS_Project_3
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI
import CoreData

struct OrderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(fetchRequest: Requests.getCartRequest(), animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name!)
                        Spacer()
                        VStack {
                            Text("Quantity: \(item.inCart)")
                            Text("Total price: \((Double(item.inCart) * item.price).roundDecimal(places: 2))")
                        }
                    }
                }
            }
            Spacer()
            
            Text("Total price: \(getTotalPrice(items: items).roundDecimal(places: 2))")
            
            Button {
                PersistenceController.shared.clearCart()
            } label: {
                Text("Buy & pay")
                    .foregroundStyle(.green)
            }.padding()
        }
    }
}

func getTotalPrice(items: FetchedResults<Item>) -> Double {
    var totalPrice = 0.0
    items.forEach { item in
        totalPrice += (Double(item.inCart) * item.price)
    }
    
    return totalPrice
}

#Preview {
    OrderView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
