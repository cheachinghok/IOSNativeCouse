//
//  LocalEventExplorerApp.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import SwiftUI
import SwiftData

@main
struct LocalEventExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(
            for: SavedEvent.self
        )
    }
}
