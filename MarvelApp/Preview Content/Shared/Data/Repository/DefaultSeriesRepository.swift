//
//  DefaultSeriesRepository.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation

///Default Series Repository
final class DefaultSeriesRepository: SeriesRepositoryProtocol {
    
    private var network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeries()) {
        self.network = network
    }
    
    func fetchSeries(id: Int) async -> [SeriesRus] {
        return await network.fetchSeries(id: id)
    }
    
}

/// MOCK
final class DefaultSeriesRepositoryMock: SeriesRepositoryProtocol {
    
    private var network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeriesMock()) {
        self.network = network
    }
    
    func fetchSeries(id: Int) async -> [SeriesRus] {
        return await network.fetchSeries(id: id)
    }
    
}
