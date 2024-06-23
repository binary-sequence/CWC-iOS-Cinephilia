//
//  DiscoverMoviesResponse.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation

struct TMDBResponse: Decodable {
    let page: Int
    let results: [Movie]
}
