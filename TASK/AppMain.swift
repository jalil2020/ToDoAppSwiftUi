//
//  TASKApp.swift
//  TASK
//
//  Created by macbook pro on 28/06/24.
//

import SwiftUI
import SwiftData

@main
struct AppMain: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
//        .modelContainer(sharedModelContainer)
    }
}