//
//  SeriesUseCase.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation

///Protocolo
protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol {get set}
    func fetchSeries(id: Int) async -> [SeriesRus]
}

///Series UseCase
final class SeriesUseCase: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = DefaultSeriesRepository(network: NetworkSeries())) {
        self.repo = repo
    }
    
    func fetchSeries(id: Int) async -> [SeriesRus] {
        return await repo.fetchSeries(id: id)
    } 
}

/// MOCK
final class SeriesUseCaseMock: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = DefaultSeriesRepository(network: NetworkSeriesMock())) {
        self.repo = repo
    }
    
    func fetchSeries(id: Int) async -> [SeriesRus] {
        return await repo.fetchSeries(id: id)
    }
}
