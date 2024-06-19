//
//  Movie.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let releaseDate: String
    let title: String
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case title
        case backdropPath = "backdrop_path"
    }
}
