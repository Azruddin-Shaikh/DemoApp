//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

@main
struct DemoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
