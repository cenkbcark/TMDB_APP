//
//  TopRatedModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.

import Foundation

// MARK: - TopRatedResponseModel
struct TopRatedMovieModel: Codable {
    let page: Int?
    let results: [Movies]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct Movies: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let vote_average: Double?
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
        case vote_average
        case voteCount
    }
}

