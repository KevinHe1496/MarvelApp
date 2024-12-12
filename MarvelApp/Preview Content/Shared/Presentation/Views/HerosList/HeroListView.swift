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
    
    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.herosData){ hero in
                    NavigationLink {
                        // Destination
                        Text("Destino: \(hero.name)")
                    } label: {
                        // Label
                        HeroRowView(hero: hero)
                    }
                    
                }
            } // fin list
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
