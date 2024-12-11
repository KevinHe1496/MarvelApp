//
//  NetworkHeros.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 10/12/24.
//

import Foundation

//Protocol
protocol NetworkHerosProtocol {
    func fetchHeros() async -> [HerosRes]
}

//Implementamos la clase
final class NetworkHeros: NetworkHerosProtocol {
    func fetchHeros() async -> [HerosRes] {
        
        var modelReturn = [HerosRes]()
        
        let urlString = "\(ConstantsApp.CONS_API_URL)\(EndPoints.heros.rawValue)\(ConstantsApp.CONS_HASH)\(ConstantsApp.CONS_TS)\(ConstantsApp.CONS_PUBLIC_KEY)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HttpMethods.get
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpRes = response as? HTTPURLResponse {
                if httpRes.statusCode == HttpResponseCodes.SUCCESS {
                    let dataHeros = try! JSONDecoder().decode(HerosModel.self, from: data)
                    modelReturn = dataHeros.data.results
                }
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
        }
        return modelReturn
    }

}
