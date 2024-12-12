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
    
    @ObservationIgnored
    private var useCaseHeros: HerosUseCaseProtocol
    
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
        
        Task {
            await getHeros()
        }
    }
    
    @MainActor
    func getHeros() async {
        let data = await useCaseHeros.fetchHeros()
        self.herosData = data
    }
    
}
