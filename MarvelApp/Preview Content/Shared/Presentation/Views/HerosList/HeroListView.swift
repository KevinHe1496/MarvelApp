//
//  HeroListView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI
import TipKit

struct HeroListView: View {
    
    @State var viewModel: HerosViewModel
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 20)), count: 1)
    private var tip = TipModel()
    
    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            // Tip
            withAnimation {
                TipView(tip, arrowEdge: .top)
                    .padding(.horizontal)
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.filteredCharacters) { hero in
                        NavigationLink {
                            HeroDetailView(viewModel: SeriesViewModel(heroesID: hero))
                        } label: {
                            HerosRowView(hero: hero)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Lista de Heroes")
            .searchable(text: $viewModel.searchText)
        }
    }
}

#Preview {
    HeroListView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseMock()))
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "es"))
}

