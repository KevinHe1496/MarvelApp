//
//  SeriesViewModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation
import Combine

@Observable
final class SeriesViewModel {
    
    var series = [SeriesRus]()
    private var heroesID: HerosRes
    
    @ObservationIgnored
    private var useCase: SeriesUseCaseProtocol
    
    init(useCase: SeriesUseCaseProtocol = SeriesUseCase(), heroesID: HerosRes) {
        self.useCase = useCase
        self.heroesID = heroesID
        Task{
            await getSeries()
        }
    }
    
    // Obtener Series mediante el id
    @MainActor
    func getSeries() async {
        let data = await useCase.fetchSeries(id: heroesID.id)
        self.series = data
    }
}
