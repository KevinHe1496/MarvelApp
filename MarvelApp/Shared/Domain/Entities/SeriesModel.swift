//
//  SeriesModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation

/// Modelo
struct SeriesModel: Codable {
    let data: SeriesResult
}

struct SeriesResult: Codable {
    let results: [SeriesRus]
}

struct SeriesRus: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: ThumbnailSeries
}

struct ThumbnailSeries: Codable {
    let path: String
    let thumbnailExtension: ExtensionSeries
    
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum ExtensionSeries: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

