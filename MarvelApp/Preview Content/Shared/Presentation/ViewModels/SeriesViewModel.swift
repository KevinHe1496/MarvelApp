//
//  SeriesViewModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation

@Observable
final class SeriesViewModel {
    
    var series = [SeriesRus]()
    
    
    
    @ObservationIgnored
    private var useCase: SeriesUseCaseProtocol
    
    init(useCase: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.useCase = useCase
        
    }
    
    // Obtener Series mediante el id
    @MainActor
    func getSeries(id: Int) async {
        let data = await useCase.fetchSeries(id: id)
        self.series = data
    }
}
