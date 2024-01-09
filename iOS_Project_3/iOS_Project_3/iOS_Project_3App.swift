//
//  iOS_Project_3App.swift
//  iOS_Project_3
//
//  Created by Daniel Latos on 09/01/2024.
//

import SwiftUI

@main
struct iOS_Project_3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
