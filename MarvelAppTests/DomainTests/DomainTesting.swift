
import XCTest
@testable import MarvelApp

final class DomainTesting: XCTestCase {
    
    func testModelHeros() {
        let hero = HerosRes(
            name: "3-D Man",
            id: 1011334,
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: .jpg
            )
        )
        
        XCTAssertNotNil(hero)
        XCTAssertEqual(hero.name, "3-D Man")
        XCTAssertEqual(hero.id, 1011334)
        XCTAssertEqual(hero.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(hero.thumbnail.thumbnailExtension.rawValue, "jpg")
    }
    
    func testDomainHerosSuccess() async {
        let heroUseCase = HerosUseCase(repo: DefaultHerosRepositoryMock())
        XCTAssertNotNil(heroUseCase)
        
        let heroResponse = await heroUseCase.fetchHeros()
        XCTAssertEqual(heroResponse.count, 3)
    }
    
    func testDomainHerosError() async {
        let heroUseCase = HerosUseCase(repo: DefaultHerosRepository())
        XCTAssertNotNil(heroUseCase)
        
        let heroResponse = await heroUseCase.fetchHeros()
        XCTAssertNotEqual(heroResponse.count, 5)
    }
    
    func testDomainSeriesSuccess() async {
        let seriesUseCase = SeriesUseCase(repo: DefaultSeriesMock())
        XCTAssertNotNil(seriesUseCase)
        
        let seriesResponse = await seriesUseCase.fetchSeries(id: 1)
        XCTAssertEqual(seriesResponse.count, 2)
    }
}
