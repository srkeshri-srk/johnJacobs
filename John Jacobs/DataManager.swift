//
//  DataManager.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 20/02/22.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var movie: [Movie]?
    
    func updateFavourite(of data: MovieList) {
        var pos = -1
        if let movies = movie {
            for var movieItems in movies {
                pos += 1
                if movieItems.movieList == data {
                    movieItems.favourite = !movieItems.favourite
                    movie?[pos] = movieItems
                }
            }
        }
    }
}
