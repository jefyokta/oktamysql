//
//  OktaaMysqlApp.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import SwiftUI

@main
struct OktaaMysqlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
