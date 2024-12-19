//
//  HerosUseCase.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 11/12/24.
//

import Foundation

///Protocolo
protocol HerosUseCaseProtocol {
    var repo: HerosRepositoryProtocol {get set}
    func fetchHeros() async -> [HerosRes]
}

/// Heros UseCase
final class HerosUseCase: HerosUseCaseProtocol {
    
    var repo: any HerosRepositoryProtocol
    
    init(repo: any HerosRepositoryProtocol = DefaultHerosRepository(network: NetworkHeros())) {
        self.repo = repo
    }
    
    func fetchHeros() async -> [HerosRes] {
        return await repo.fetchHeros()
    }
}
// MOCK
final class HerosUseCaseMock: HerosUseCaseProtocol {
    
    var repo: any HerosRepositoryProtocol
    
    init(repo: any HerosRepositoryProtocol = DefaultHerosRepository(network: NetworkHerosMock())) {
        self.repo = repo
    }
    
    func fetchHeros() async -> [HerosRes] {
        return await repo.fetchHeros()
    }
}
