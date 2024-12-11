//
//  ErrorView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Environment(AppStateVM.self) var appState
    
    private var textError: String
    
    init(textError: String) {
        self.textError = textError
    }
    
    var body: some View {
        ZStack{
            Image("")
                .resizable()
                .background(Color.red)
            VStack {
                
                // Imagen error
                Image(systemName: "xmark.seal")
                    .font(.system(size: 80))
                    .foregroundStyle(.white)
                    .padding(.bottom)
                
                // Texto
                Text("OOOOPS!")
                    .font(.title)
                    .padding(.bottom, 50)
                    .foregroundStyle(.white)
                    .bold()
                Text("Algo salio mal.")
                    .foregroundStyle(.white)
                Text("Por favor intentalo de nuevo.")
                    .foregroundStyle(.white)
                    .padding(.bottom, 50)
                
                // Boton Regresar
                Button {
                    appState.status = .none
                } label: {
                    Text("Regresar")
                        .font(.headline)
                        .foregroundStyle(.red)
                        .frame(width: 200, height: 50)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 7, x: 7, y: 7)
                    
                }
                
            } // fin vstack
        } // fin zstack
        
        
    }
}

#Preview {
    ErrorView(textError: "Error de preview")
        .environment(AppStateVM())
}
