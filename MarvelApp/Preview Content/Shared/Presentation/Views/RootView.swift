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
            
        case .none:
            withAnimation {
                SplashView()
            }
            
        case .loaded:
            withAnimation {
                HeroListView()
            }
            
        case .loading:
            withAnimation {
                LoaderView()
            }
            
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
}
