/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A structure for representing quake data.
*/

import Foundation

struct Quake {
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
    let tsunami: Double
    var location: QuakeLocation?
}

extension Quake: Identifiable {
    var id: String { code }
}

extension Quake: Decodable {
    private enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case code
        case detail
        case tsunami
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawMagnitude = try? values.decode(Double.self, forKey: CodingKeys.magnitude)
        let rawPlace = try? values.decode(String.self, forKey: CodingKeys.place)
        let rawTime = try? values.decode(Date.self, forKey: CodingKeys.time)
        let rawCode = try? values.decode(String.self, forKey: CodingKeys.code)
        let rawDetail = try? values.decode(URL.self, forKey: CodingKeys.detail)
        let rawTsunami = try? values.decode(Double.self, forKey: CodingKeys.tsunami)

        guard let magnitude = rawMagnitude,
              let place = rawPlace,
              let time = rawTime,
              let code = rawCode,
              let detail = rawDetail,
              let tsunami = rawTsunami
        else {
            throw QuakeError.missingData
        }

        self.magnitude = magnitude
        self.place = place
        self.time = time
        self.code = code
        self.detail = detail
        self.tsunami = tsunami
    }
}
