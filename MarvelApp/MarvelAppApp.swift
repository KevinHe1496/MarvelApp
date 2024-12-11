//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI

@main
struct MarvelAppApp: App {
    
    @State var appState = AppStateVM() // ViewModel global
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
