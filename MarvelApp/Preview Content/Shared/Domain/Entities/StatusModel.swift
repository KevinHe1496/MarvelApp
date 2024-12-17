//
//  StatusModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation

/// Estados de la aplicación
enum Status {
    case none, loading, loaded, error(error: String)
}
