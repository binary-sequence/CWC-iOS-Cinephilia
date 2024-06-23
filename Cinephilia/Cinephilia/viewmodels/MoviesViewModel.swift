//
//  MoviesViewModel.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation
import SwiftUI

@Observable
class MoviesViewModel {
    let service = DataService()
    var movies: [Movie]?
    var selectedMovie: Movie?
    
    func getBackdropURL(backdropPath: String) -> String {
        return "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    
    func getNewReleases() {
        Task {
            movies = await service.getNewReleases()
        }
    }
    
    func searchMovies(userParams: [String]) {
        let userParams = userParams.joined(separator: "&")
        Task {
            movies = await service.searchMovies(userParams: userParams)
        }
    }
}
