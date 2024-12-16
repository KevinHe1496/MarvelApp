//
//  DataTests.swift
//  MarvelAppTests
//
//  Created by Kevin Heredia on 16/12/24.
//

import Testing
@testable import MarvelApp

struct DataTests {

    @Suite("Data Testing")
    struct DataTests {
        
        @Suite("Data", .serialized) struct DataTestsMVApp {
            @Test("Heros Network")
            func NetworkHeroesTest() async throws {
                
            }
        }
    }

}
