//
//  DataTesting.swift
//  MarvelAppTests
//
//  Created by Kevin Heredia on 16/12/24.
//

import Testing
import SwiftUI
import ViewInspector
@testable import MarvelApp

struct DataTesting {

    @Suite("Data Testing")
    struct DataNetworkTests {
        
        @Suite("Data", .serialized) struct DataTests {
            
            @Test("Data Network")
            func DataNetworkModelsTests() async throws {
                /// EndPoints
                #expect(EndPoints.heros.rawValue  == "/v1/public/characters")
                #expect(EndPoints.series.rawValue  == "/v1/public/characters/")
                
                ///HTTPMethods
                #expect(HttpMethods.post == "POST")
                #expect(HttpMethods.get == "GET")
                #expect(HttpMethods.put == "PUT")
                #expect(HttpMethods.content == "application/json")
                
                ///HTTPResponseCodes
                #expect(HttpResponseCodes.CONFLICT == 409)
                #expect(HttpResponseCodes.NOT_AUTHORIZED == 401)
                #expect(HttpResponseCodes.ERROR == 502)
                #expect(HttpResponseCodes.NOT_FOUND == 404)
                #expect(HttpResponseCodes.SUCCESS == 200)
            }
            
            @Test("Network Heros Mock")
            func DataNetworkHerosMockTest() async throws {
                let network = NetworkHerosMock()
                #expect(network != nil)
                
                //get Heros
                #expect(await network.fetchHeros().count == 3)
            }
            
            @Test("Network Series Mock")
            func DataNetworkSeriesMockTest() async throws {
                let network = NetworkSeriesMock()
                #expect(network != nil)
                
                //get Series
                #expect(await network.fetchSeries(id: 1).count == 2)
            }
            
        }
        
    }

}
