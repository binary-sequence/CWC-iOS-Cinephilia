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
    var movies = [Movie]()
    
    func discoverMovies() {
        Task {
            movies = await service.discoverMovies()
        }
    }
    
    func getBackdropURL(backdropPath: String) -> String {
        return "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
}
