//
//  QuakesProvider.swift
//  Earthquakes
//
//  Created by Stanislav Romanov on 12.10.2024.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {
    @Published var quakes: [Quake] = []
    let client: QuakeClient

    func fetchQuakes() async throws {
        quakes = try await client.quakes
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
