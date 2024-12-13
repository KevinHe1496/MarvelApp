//
//  HeroDetailView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import SwiftUI

struct HeroDetailView: View {
    
    @State var hero: HerosRes
    @State var viewModel: SeriesViewModel
    
    init(viewModel: SeriesViewModel = SeriesViewModel(), hero: HerosRes) {
        self.viewModel = viewModel
        self.hero = hero
        
        Task {
            await viewModel.getSeries(id: hero.id)
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.series){ serie in
                    Text(serie.title)
                }
            }
           
        }
    }
}

#Preview {
    HeroDetailView(hero: HerosRes(name: "Linterna Verde", id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)))
}
