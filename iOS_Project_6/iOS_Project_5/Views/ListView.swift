//
//  ListView.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)],
        animation: .default)
    private var categories: FetchedResults<Category>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    Section(header: Text(category.name!)) {
                        if let items = category.items?.allObjects as? [Item] {
                            ForEach(items.sorted(by: { $0.name! < $1.name!})) { item in
                                NavigationLink {
                                    DetailsView(item: item)
                                } label: {
                                    HStack {
                                        Text(item.name!)
                                        Spacer()
                                        Text("Price: \(item.price.roundDecimal(places: 2))")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
