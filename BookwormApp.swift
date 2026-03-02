//
//  BookwormApp.swift
//  Bookworm
//
//  Created by John Bradshaw on 19/06/2025.
//

import SwiftData
import SwiftUI


@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}








