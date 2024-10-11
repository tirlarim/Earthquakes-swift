//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Stanislav Romanov on 11.10.2024.
//

import XCTest
@testable import Earthquakes

class EarthquakesTests: XCTestCase {
    func testGeoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)
        XCTAssertEqual(quake.code, "73649170")
        
        let msInSecond = 1000.0
        let expectedSeconds = TimeInterval(1636129710550) / msInSecond
        let decodedSeconds = quake.time.timeIntervalSince1970
        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)
        
        let expectedTsunami = 0.0
        let decodedTsunami = quake.tsunami
        XCTAssertEqual(expectedTsunami, decodedTsunami)
    }
}
