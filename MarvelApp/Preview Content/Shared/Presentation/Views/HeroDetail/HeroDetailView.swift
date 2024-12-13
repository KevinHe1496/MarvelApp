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
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 20)), count: 1)
    
    init(viewModel: SeriesViewModel = SeriesViewModel(), hero: HerosRes) {
        self.viewModel = viewModel
        self.hero = hero
        
        Task(priority: .high) {
            await viewModel.getSeries(id: hero.id)
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.series) { serie in
                    HeroDetailRowView(serie: serie)
                }
            }
        }
        .navigationTitle("Series") 
            
    }
}

#Preview {
    HeroDetailView(hero: HerosRes(name: "Linterna Verde", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg)))
}
