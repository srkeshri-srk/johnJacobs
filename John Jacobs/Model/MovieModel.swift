//
//  MovieModel.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 17/02/22.
//

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let page: Int
    let movieList: [MovieList]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movieList = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieList
struct MovieList: Codable, Equatable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let favourite: Bool = false

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case favourite
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title
    }
    
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case pt = "pt"
}

struct Movie {
    var movieList: MovieList?
    var favourite: Bool = false
    
    init() {}
    
    init(data: MovieList) {
        movieList = data
        favourite = false
    }
}
