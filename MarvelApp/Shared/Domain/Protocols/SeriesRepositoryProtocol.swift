//
//  SeriesRepositoryProtocol.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation

/// Repository Protocol
protocol SeriesRepositoryProtocol {
    func fetchSeries(id: Int) async -> [SeriesRus]
}
