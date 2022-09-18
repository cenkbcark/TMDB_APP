//
//  UpComing.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

// MARK: - UpComingMovieModel
struct UpComingMovieModel: Codable {
    let dates: Dates?
    let page: Int?
    let results: [UpComingMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct UpComingMovie: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: orgLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case poster_path
        case release_date
        case title, video
        case voteAverage
        case voteCount
    }
}

enum orgLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ko = "ko"
}

