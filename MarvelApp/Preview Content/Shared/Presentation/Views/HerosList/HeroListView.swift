//
//  HeroListView.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 9/12/24.
//

import SwiftUI

struct HeroListView: View {
    
    @State var viewModel: HerosViewModel
    @State private var filter: String = ""
    let columns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)
    
    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.herosData) { hero in
                        NavigationLink {
                            Text("Destino: \(hero.name)")
                        } label: {
                            HerosRowView(hero: hero)
                        }
      
                    }
                }
            } // fin scroll view

            .navigationTitle("Lista de Heroes")
            .searchable(text: $filter)
        } // fin navigationstack
        
    }
}

#Preview {
    HeroListView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseMock()))
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "es"))
    
}
