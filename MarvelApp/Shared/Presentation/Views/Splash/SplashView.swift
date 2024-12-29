//
//  SplashView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        ZStack{
            // Imagen
            Image(.splashBackground)
                .resizable()
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)
        }
        .onAppear{
            appState.startSplashToHerosList()
        }
    }
}

#Preview {
    SplashView()
        .environment(AppStateVM())
}
