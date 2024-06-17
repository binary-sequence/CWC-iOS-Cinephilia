//
//  Movie.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let originalTitle: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
    }
}
