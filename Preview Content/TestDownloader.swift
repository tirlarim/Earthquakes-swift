//
//  TestDownloader.swift
//  Earthquakes
//
//  Created by Stanislav Romanov on 12.10.2024.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testQuakesData
    }
}
