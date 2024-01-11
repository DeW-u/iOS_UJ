//
//  iOS_Project_4App.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 11/01/2024.
//

import SwiftUI

@main
struct iOS_Project_4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
