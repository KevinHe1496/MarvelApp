

import XCTest
@testable import MarvelApp

final class DataNetworkTests: XCTestCase {
    
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
    
    func testNetworkHerosMock() async {
        let network = NetworkHerosMock()
        XCTAssertNotNil(network)
        
        // get Heros
        let heros = await network.fetchHeros()
        XCTAssertEqual(heros.count, 3)
    }
    
    func testNetworkSeriesMock() async {
        let network = NetworkSeriesMock()
        XCTAssertNotNil(network)
        
        // get Series
        let series = await network.fetchSeries(id: 1)
        XCTAssertEqual(series.count, 2)
    }
}
