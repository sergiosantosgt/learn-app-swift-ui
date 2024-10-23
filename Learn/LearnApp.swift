//
//  LearnApp.swift
//  Learn
//
//  Created by Sergio Santos on 23/07/24.
//

import SwiftUI

@main
struct LearnApp: App {
    
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(appState)
            }
        }
    }
}
