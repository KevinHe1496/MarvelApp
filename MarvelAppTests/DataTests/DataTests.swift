

import XCTest
@testable import MarvelApp

final class DataNetworkTests: XCTestCase {
    
    // MARK: - Test Data Network Models
    func testDataNetworkModels() {
        /// EndPoints
        XCTAssertEqual(EndPoints.heros.rawValue, "/v1/public/characters")
        XCTAssertEqual(EndPoints.series.rawValue, "/v1/public/characters/")
        
        /// HTTPMethods
        XCTAssertEqual(HttpMethods.post, "POST")
        XCTAssertEqual(HttpMethods.get, "GET")
        XCTAssertEqual(HttpMethods.put, "PUT")
        XCTAssertEqual(HttpMethods.content, "application/json")
        
        /// HTTPResponseCodes
        XCTAssertEqual(HttpResponseCodes.CONFLICT, 409)
        XCTAssertEqual(HttpResponseCodes.NOT_AUTHORIZED, 401)
        XCTAssertEqual(HttpResponseCodes.ERROR, 502)
        XCTAssertEqual(HttpResponseCodes.NOT_FOUND, 404)
        XCTAssertEqual(HttpResponseCodes.SUCCESS, 200)
    }
    
    // MARK: - Test ConstantsApp
    func testConstantsApp() {
        XCTAssertEqual(ConstantsApp.CONS_API_URL, "http://gateway.marvel.com")
        XCTAssertEqual(ConstantsApp.CONS_HASH, "e5645a37500147be54b7fcdf27fced2d")
        XCTAssertEqual(ConstantsApp.CONS_TS, "1")
        XCTAssertEqual(ConstantsApp.CONS_PUBLIC_KEY, "2c723f9607bbe83de1a1fa92c52ea04f")
    }
    
    // MARK: - Test Network Heros Mock
    func testNetworkHerosMock() async {
        let network = NetworkHerosMock()
        XCTAssertNotNil(network)
        
        // get Heros
        let heros = await network.fetchHeros()
        XCTAssertEqual(heros.count, 3)
    }
    
    
    // MARK: - Test Network Series Mock
    func testNetworkSeriesMock() async {
        let network = NetworkSeriesMock()
        XCTAssertNotNil(network)
        
        // get Series
        let series = await network.fetchSeries(id: 1)
        XCTAssertEqual(series.count, 2)
    }
}
