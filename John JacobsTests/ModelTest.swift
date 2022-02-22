//
//  ModelTest.swift
//  John JacobsTests
//
//  Created by Shreyansh Raj Keshri on 22/02/22.
//

import XCTest
@testable import John_Jacobs

class ModelTest: XCTestCase {
    
    var movie1: Movie!
    var movie2: Movie!
    var movieList: MovieList!
    
    var movieViewModel: MovieViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        movie1 = Movie()
        movieList = MovieList(adult: true, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: .en, originalTitle: "", overview: "", popularity: 0.0, posterPath: "", releaseDate: "", title: "", video: true, voteAverage: 0.0, voteCount: 1)
        movie2 = Movie(data: movieList)
        
        movieViewModel?.hitRequest {
            print("Test Done!!")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        movie1 = nil
        movie2 = nil
        movieList = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
