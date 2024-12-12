//
//  HeroRowView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import SwiftUI

struct HeroRowView: View {
    
    var hero: HerosRes
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 7, x: 7,y: 7)
                    .padding()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 7, x: 7,y: 7)
                    .padding()
            }
            Text(hero.name)
                .font(.headline)
                .bold()

        }
    }
}

#Preview {
    HeroRowView(hero: HerosRes(name: "Linterna Verde", id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)))
}
