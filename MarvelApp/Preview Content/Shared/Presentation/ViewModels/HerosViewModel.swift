//
//  HerosViewModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import Foundation
import Combine


@Observable
final class HerosViewModel: ObservableObject {
    
    var herosData = [HerosRes]()
    var searchText = ""
    
    @ObservationIgnored
    private var useCaseHeros: HerosUseCaseProtocol
    
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
        
        Task {
            await getHeros()
        }
    }
    
    // Filtrar Heroes
    var filteredCharacters: [HerosRes] {
        if searchText.isEmpty {
            return herosData
        } else {
            return herosData.filter { hero in
                hero.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    // Obtener Heroes
    @MainActor
    func getHeros() async {
        let data = await useCaseHeros.fetchHeros()
        self.herosData = data
    }
    
}
