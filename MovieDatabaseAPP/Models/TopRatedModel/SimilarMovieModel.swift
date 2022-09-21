import Foundation




// MARK: - SimilarMovieModel
struct SimilarMovieModel: Codable {
    let page: Int?
    let results: [SimilarMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct SimilarMovie: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLang?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genreIDS
        case id
        case originalLanguage
        case original_title
        case overview, popularity
        case poster_path
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}

enum OriginalLang: String, Codable {
    case en = "en"
    case fr = "fr"
}
