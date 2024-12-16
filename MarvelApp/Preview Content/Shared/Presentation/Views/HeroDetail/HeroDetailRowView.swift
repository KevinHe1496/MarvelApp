//
//  HeroDetailRowView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import SwiftUI

struct HeroDetailRowView: View {
    
    let serie: SeriesRus
    
    var body: some View {
    
      
            ZStack {
                VStack() {
                    // Imagen
                    AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { photo in
                        photo
                            .resizable()
                            .frame(height: 250)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .aspectRatio(contentMode: .fill)
                            .padding(.bottom, 30)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                            .frame(height: 250)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.bottom, 30)
                        
                    }
                    
                    // Titulo y descripción
                    Text(serie.title)
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .lineLimit(2)
                    Text(serie.description ?? "No tiene descripción")
                        .foregroundStyle(.black)
                        .lineLimit(4)
                        .padding(.horizontal)
                    Spacer()
                }
                .frame(width: 340, height: 400)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 7, x: 7, y: 7)
                .padding(.bottom, 50)
                
                
                
                
            } // fin zstack
            
 
        
    }
}

#Preview {
    HeroDetailRowView(serie: SeriesRus(id: 1011334, title: "Avengers: The Initiative (2007 - 2010)", description: "", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ExtensionSeries.jpg)))
}
