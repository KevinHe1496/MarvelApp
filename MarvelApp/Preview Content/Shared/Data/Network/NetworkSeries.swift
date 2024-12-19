//
//  NetworkSeries.swift
//  MarvelApp
//
//  Created by Kevin Heredia on 13/12/24.
//

import Foundation


/// Protocol
protocol NetworkSeriesProtocol {
    func fetchSeries(id: Int) async -> [SeriesRus]
}

/// Network Series
final class NetworkSeries: NetworkSeriesProtocol {
    
    func fetchSeries(id: Int) async -> [SeriesRus] {
        
        var modelReturn = [SeriesRus]()
        
        let urlString = "\(ConstantsApp.CONS_API_URL)\(EndPoints.series.rawValue)\(id)/series?hash=\(ConstantsApp.CONS_HASH)&ts=\(ConstantsApp.CONS_TS)&apikey=\(ConstantsApp.CONS_PUBLIC_KEY)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HttpMethods.get
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpRes = response as? HTTPURLResponse {
                if httpRes.statusCode == HttpResponseCodes.SUCCESS {
                    let dataHeros = try JSONDecoder().decode(SeriesModel.self, from: data)
                    modelReturn = dataHeros.data.results
                }
            }
        } catch {
            NSLog("Error en heroes: \(error.localizedDescription)")
        }
        return modelReturn
    }
    
    
}


/// MOCK
final class NetworkSeriesMock: NetworkSeriesProtocol {
    func fetchSeries(id: Int) async -> [SeriesRus] {
        
        let model1 = SeriesRus(id: 1, title: "Advengers 2008", description: "", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: ExtensionSeries.jpg))
        
        let model2 = SeriesRus(id: 1, title: "Advengers 2012", description: "", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: ExtensionSeries.jpg))
        
        return [model1, model2]
    }
}








//final class NetworkHerosMock: NetworkHerosProtocol {
//    func fetchHeros() async -> [HerosRes] {
//        
//        let model1 = HerosRes(name: "Lintera Verde", id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), series: SeriesData(items: [ItemsData(resourceURI: "", name: "Carlos")]))
//        let model2 = HerosRes(name: "DeadPool", id: 2, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg), series: SeriesData(items: [ItemsData(resourceURI: "", name: "Carlos")]))
//        let model3 = HerosRes(name: "Wolverin", id: 3, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: Extension.jpg), series: SeriesData(items: [ItemsData(resourceURI: "", name: "Carlos")]))
//        
//        return [model1, model2, model3]
//    }
//    
//    
//}
