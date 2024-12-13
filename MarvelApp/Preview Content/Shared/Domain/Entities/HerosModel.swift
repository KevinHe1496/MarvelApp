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

struct HerosRes: Codable, Identifiable {
    let name: String
    let id: Int
    let thumbnail: Thumbnail
    let series: SeriesData
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

struct SeriesData: Codable {
    let items: [ItemsData]
}

struct ItemsData: Codable, Hashable {
    let resourceURI: String
    let name: String
}
