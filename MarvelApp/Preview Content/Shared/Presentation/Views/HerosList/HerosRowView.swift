//
//  HerosRowView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 12/12/24.
//

import SwiftUI

struct HerosRowView: View {
    
    let hero: HerosRes
    
    var body: some View {
        ZStack {
            
            // Imagen
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top
                                      )
                        .frame(height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 20)),
                        alignment: .bottom
                        
                    )
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 7, x: 7,y: 7)
                    .padding()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 250)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 7, x: 7,y: 7)
                
            }
            
            //Texto nombre
            Text(hero.name)
                .bold()
                .foregroundStyle(.white)
                .padding(.top, 210)
                .padding(.horizontal)
        } // fin Hstack
        
    }
}

#Preview {
    HerosRowView(hero: HerosRes(name: "Linterna Verde", id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)))
}
