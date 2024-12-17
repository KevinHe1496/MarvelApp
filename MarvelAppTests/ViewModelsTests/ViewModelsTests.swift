import XCTest
@testable import MarvelApp

final class ViewModelsTests: XCTestCase {
    
    @MainActor
    func testHeroViewModel() async throws {
        let viewModel = HerosViewModel(useCaseHeros: HerosUseCaseMock())
        XCTAssertNotNil(viewModel)
        let expectation = self.expectation(description: "Get Heros")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 5)
        XCTAssertEqual(viewModel.herosData.count, 3)
    }
    
    @MainActor
    func testSeriesViewModel() async throws {
        
        let hero = HerosRes(name: "Linterna Verde", id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))
        
        let viewModel = SeriesViewModel(useCase: SeriesUseCaseMock(), heroesID: hero)
        XCTAssertNotNil(viewModel)
        let expectation = self.expectation(description: "Get Series")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 5)
        XCTAssertEqual(viewModel.series.count, 2)
    }
}
