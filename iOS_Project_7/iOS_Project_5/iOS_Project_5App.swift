//
//  iOS_Project_5App.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 14/01/2024.
//

import SwiftUI

@main
struct iOS_Project_5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
