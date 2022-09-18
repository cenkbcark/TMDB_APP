//
//  File.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import Foundation

// MARK: - VideoModel
struct MovieVideoModel: Codable {
    let id: Int?
    let results: [MovieVideo]?
}

// MARK: - Result
struct MovieVideo: Codable {
    let iso639_1: ISO639_1?
    let iso3166_1: ISO3166_1?
    let name, key: String?
    let site: Site?
    let size: Int?
    var type: TypeEnum?
    let official: Bool?
    let publishedAt, id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1
        case iso3166_1
        case name, key, site, size, type, official
        case publishedAt
        case id
    }
}

enum ISO3166_1: String, Codable {
    case us = "US"
}

enum ISO639_1: String, Codable {
    case en = "en"
}

enum Site: String, Codable {
    case youTube = "YouTube"
}

enum TypeEnum: String, Codable {
    case behindTheScenes = "Behind the Scenes"
    case clip = "Clip"
    case featurette = "Featurette"
    case trailer = "Trailer"
}

