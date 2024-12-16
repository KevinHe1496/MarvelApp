//
//  DomainTesting.swift
//  MarvelAppTests
//
//  Created by Kevin Heredia on 16/12/24.
//

import Testing
@testable import MarvelApp

struct  DomainTesting {
    
    @Suite("Domain Testing")
    struct DomainModelTest {
        
        @Suite("Entidades", .serialized) struct ModelTest {
            
            
            /// Heros Model
            @Test("Heros Model")
            func modelHerosTest() async throws {
                let hero =  HerosRes(name: "3-D Man", id: 1011334, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))
                
                #expect(hero != nil)
                #expect(hero.name == "3-D Man")
                #expect(hero.id == 1011334)
                #expect(hero.thumbnail.path == "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
                #expect(hero.thumbnail.thumbnailExtension.rawValue == "jpg")
            }
            
            /// Series Model
            @Test("Series Model")
            func modelSeriesTest() async throws {
                let hero =  SeriesRus(id: 1011334, title: "Avengers: The Initiative (2007 - 2010)", description: "", thumbnail: ThumbnailSeries(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ExtensionSeries.jpg))
                
                #expect(hero != nil)
                #expect(hero.title == "Avengers: The Initiative (2007 - 2010)")
                #expect(hero.id == 1011334)
                #expect(hero.description == "")
                #expect(hero.thumbnail.path == "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5")
                #expect(hero.thumbnail.thumbnailExtension.rawValue == "jpg")
            }
        }
        
        @Suite("Domain Testing", .serialized) struct DomainTest {
            
            /// Heros UseCase
            
            @Test("Hero UseCase")
            func DomainHerosSuccessTest() async throws {
                
                let heroUseCase = HerosUseCase(repo: DefaultHerosRepositoryMock())
                #expect(heroUseCase != nil)
                
                let heroResponse = await heroUseCase.fetchHeros()
                #expect(heroResponse.count == 3)
            }
            
            /// Heros UseCase Error
            @Test("Heros UseCase")
            func DomainHerosErrorTest() async throws {
                
                let heroUseCase = HerosUseCase(repo: DefaultHerosRepository())
                #expect(heroUseCase != nil)
                
                let heroResponse = await heroUseCase.fetchHeros()
                #expect(heroResponse.count != 5)
            }
            /// Series UseCase
            @Test("Series UseCase")
            func DomainSeriesErrorTest() async throws {
                
                let SeriesUseCase = SeriesUseCase(repo: DefaultSeriesMock())
                #expect(SeriesUseCase != nil)
                
                let SerieResponse = await SeriesUseCase.fetchSeries(id: 1)
                #expect(SerieResponse.count == 2)
            }
            
        }
    }
    
}
