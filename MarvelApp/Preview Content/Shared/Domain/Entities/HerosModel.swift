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

