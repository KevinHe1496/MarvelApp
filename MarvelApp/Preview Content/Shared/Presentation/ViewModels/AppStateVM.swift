//
//  AppStateVM.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation
import Combine

@Observable
final class AppStateVM {
    //Publicadas
    var status = Status.none
    // Dependencia
    private var herosUseCase: HerosUseCaseProtocol
    
    init(herosUseCase: HerosUseCaseProtocol = HerosUseCase()) {
        self.herosUseCase = herosUseCase 
    }
    
    @MainActor
    func getHeros() {
        
        self.status = .loading
        
        Task {
            if await herosUseCase.fetchHeros().isEmpty {
                self.status = .error(error: "Error al cargar los heros")
            } else {
                self.status = .loaded
            }
        }
    }
    
    // Empezar el splash screen despues de dos segundos aparezca el Heros List
    func startSplashToHerosList() {
        status = .none

         DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
             DispatchQueue.main.async {
                 self.getHeros()
             }
         }
     }
    
    
}

