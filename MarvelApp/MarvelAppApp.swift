//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI
import TipKit

@main
struct MarvelAppApp: App {
    
    @State var appState = AppStateVM() // ViewModel global
    
    init() {
        try? Tips.resetDatastore()
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
