//
//  LoaderView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            //Progress
            ProgressView()
                .scaleEffect(1.5)
                .padding()
            // Animación texto
            Text("Cargando...")
                .opacity(isAnimating ? 0 : 1) 
                .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    LoaderView()
}
