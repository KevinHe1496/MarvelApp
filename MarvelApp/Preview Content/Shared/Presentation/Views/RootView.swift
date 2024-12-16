//
//  RootView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        switch appState.status {
            
            // Splash Screen
        case .none:
            withAnimation {
                SplashView()
            }
            // Heros list Screen
        case .loaded:
            withAnimation {
                HeroListView()
            }
            // Loader Screen
        case .loading:
            withAnimation {
                LoaderView()
            }
            // Error Screen
        case .error(error: let errorString):
            withAnimation {
                ErrorView(textError: errorString)
            }
        
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
        .environment(\.locale, .init(identifier: "es"))
        .preferredColorScheme(.light)
}
