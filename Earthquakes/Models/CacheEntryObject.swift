//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by Stanislav Romanov on 13.10.2024.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
