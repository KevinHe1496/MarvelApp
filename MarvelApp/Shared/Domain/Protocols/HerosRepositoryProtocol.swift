//
//  HerosRepositoryProtocol.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation

/// Repository Protocol
protocol HerosRepositoryProtocol {
    func fetchHeros() async -> [HerosRes]
}
