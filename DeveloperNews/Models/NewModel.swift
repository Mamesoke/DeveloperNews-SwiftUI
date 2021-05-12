// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - NewsValue
struct NewsValue: Codable, Identifiable {
    let id = UUID()
    let boolLittleImage: Bool
    let date, newsDescription: String
    let image: String
    let linkNew: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case boolLittleImage = "bool-little-image"
        case date
        case newsDescription = "description"
        case image
        case linkNew = "link-new"
        case title
    }
}

typealias News = [String: NewsValue]


func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
