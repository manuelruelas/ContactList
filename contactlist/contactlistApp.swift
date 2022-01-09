//
//  contactlistApp.swift
//  contactlist
//
//  Created by Mac mini on 08/01/22.
//

import SwiftUI

@main
struct contactlistApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
