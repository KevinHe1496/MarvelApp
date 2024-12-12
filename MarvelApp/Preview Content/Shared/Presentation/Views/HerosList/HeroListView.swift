//
//  HeroListView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI

struct HeroListView: View {
    
    @StateObject var viewModel: HerosViewModel
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)
    
    init(viewModel: HerosViewModel = HerosViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.filteredCharacters) { hero in
                        NavigationLink {
                            Text("Destino: \(hero.name)")
                        } label: {
                            HerosRowView(hero: hero)
                        }
                    }
                }
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

