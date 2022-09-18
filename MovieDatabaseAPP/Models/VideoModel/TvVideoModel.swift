//
//  TvVideoModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 18.09.2022.
//

import Foundation

// MARK: - VideoModel
struct TvVideoModel: Codable {
    let id: Int?
    let results: [TvVideo]?
}

// MARK: - Result
struct TvVideo: Codable {
    let iso639_1, iso3166_1, name, key: String?
    let site: String?
    let size: Int?
    let type: String?
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
