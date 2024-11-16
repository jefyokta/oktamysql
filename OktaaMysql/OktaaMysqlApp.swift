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
            ZStack {
                CustomWindow()
               Home()
            }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false))

    
    }
}
struct CustomWindow: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.material = .sidebar
        visualEffectView.state = .active
        
        if let window = NSApplication.shared.windows.first {
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .hidden
            window.isOpaque = false
        }

        return visualEffectView
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        // Tidak perlu memperbarui
    }
}
