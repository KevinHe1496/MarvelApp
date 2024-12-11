//
//  HerosModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation

struct HerosModel: Codable {
    let data: HeroResult
}

struct HeroResult: Codable {
    let results: [HerosRes]
}

struct HerosRes: Codable, Identifiable, Equatable {
    let name: String
    let id: Int
}
