//
//  TipModel.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 18/12/24.
//

import Foundation
import TipKit

struct TipModel: Tip {
    
    var title: Text{
        Text("Filtrar Héroes.")
    }
    
    var message: Text? {
        Text("Usa este buscador para encontrar al héroe que buscas.")
    }
    
    var options: [TipOption] {
        Tip.MaxDisplayCount(1)
    }
    
    var image: Image?{
        Image(systemName: "lightbulb.max.fill")
    }
    
}
