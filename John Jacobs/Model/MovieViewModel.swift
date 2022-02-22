//
//  MovieViewModel.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 17/02/22.
//

import Foundation

class MovieViewModel {
    var data: MovieModel?
    
    func hitRequest(completion: @escaping () -> Void) {
        if let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=7e588fae3312be4835d4fcf73918a95f&query=a%20&page=01") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil, let data = data {
                    do {
                        let sessionResponse = try JSONDecoder().decode(MovieModel.self, from: data)
                        self.data = sessionResponse
                        completion()
                    } catch let err {
                        print(err.localizedDescription)
                        completion()
                    }
                } else {
                    print(error?.localizedDescription ?? "Error")
                    completion()
                }
            }.resume()
        }
    }
}
