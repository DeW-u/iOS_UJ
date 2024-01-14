//
//  ContentView.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Products", systemImage: "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
        .task {
            do {
                let url = URL(string: "http://0.0.0.0:8010/api/categories")
                let (data, _) = try await URLSession.shared.data(from: url!)
                let categories = try JSONDecoder().decode([CategoryDomain].self, from: data)
                
                try categories.forEach { cat in
                    print("Saving category: \(cat.name)")
                    _ = cat.mapToDB(context: viewContext)
                    
                    try viewContext.save()
                }
            } catch {
                print("Download error")
            }
        }
    }
}



#Preview {
    ContentView()
}
