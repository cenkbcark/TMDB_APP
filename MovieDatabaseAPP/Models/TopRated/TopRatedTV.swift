//
//  TopRatedTV.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.

import Foundation

// MARK: - TopRatedTVModel

struct TopRatedTvModel: Codable {
    let page: Int?
    let results: [TVs]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct TVs: Codable {
    let backdrop_path, first_air_date: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [OriginCountry]?
    let originalLanguage: OriginalLanguage?
    let original_name, overview: String?
    let popularity: Double?
    let poster_path: String?
    let vote_average: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdrop_path
        case first_air_date
        case genreIDS
        case id, name
        case originCountry
        case originalLanguage
        case original_name
        case overview, popularity
        case poster_path
        case vote_average
        case voteCount
    }
}

enum OriginCountry: String, Codable {
    case ca = "CA"
    case jp = "JP"
    case kr = "KR"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ko = "ko"
}

