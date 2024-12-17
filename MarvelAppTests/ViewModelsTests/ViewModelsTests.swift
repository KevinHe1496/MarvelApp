import XCTest
@testable import MarvelApp

final class ViewModelsTests: XCTestCase {
    
    @MainActor
    func testHeroViewModel() async throws {
        let viewModel = HerosViewModel(useCaseHeros: HerosUseCaseMock())
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.herosData.count, 0)
    }
    
    @MainActor
    func testSeriesViewModel() async throws {
        let viewModel = SeriesViewModel(useCase: SeriesUseCaseMock())
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.series.count, 0)
    }
}
