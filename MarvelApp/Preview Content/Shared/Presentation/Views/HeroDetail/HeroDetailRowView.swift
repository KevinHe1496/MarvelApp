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
            VStack {
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { photo in
                    photo
                        .resizable()
                        .frame(width: 280, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 30)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .frame(width: 280, height: 200)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.bottom, 30)
                        
                }

                Text(serie.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                Text(serie.description ?? "No tiene descripción")
                    .foregroundStyle(.white)
                    .lineLimit(3)
                    .padding(.horizontal)
                    
            }
            .frame(width: 340, height: 400)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 7, x: 7, y: 7)
            
            
            
        }
        
        
    }
}

#Preview {
    HeroDetailRowView(serie: SeriesRus(id: 1011334, title: "Avengers: The Initiative (2007 - 2010)", description: "", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ExtensionSeries.jpg)))
}
