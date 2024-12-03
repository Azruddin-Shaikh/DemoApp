//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import SwiftUI

@main
struct DemoAppApp: App {
    let persistenceController = CoreDataHelper.shared
    
    init() {
        MockDataService.mockUserData()
        persistenceController.addMockData()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
