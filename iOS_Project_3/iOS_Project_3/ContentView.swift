//
//  ContentView.swift
//  iOS_Project_3
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
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
    }
}



#Preview {
    ContentView()
}
