//
//  DefaultHerosRepository.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation

final class DefaultHerosRepository: HerosRepositoryProtocol {
    
    private var network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
    }
    
    func fetchHeros() async -> [HerosRes] {
        return await network.fetchHeros()
    }
}


final class DefaultHerosRepositoryMock: HerosRepositoryProtocol {
    
    private var network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHerosMock()) {
        self.network = network
    }
    
    func fetchHeros() async -> [HerosRes] {
        return await network.fetchHeros()
    }
}
