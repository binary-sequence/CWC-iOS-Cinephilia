//
//  DataServices.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation

struct DataService {
    func discoverMovies() async -> [Movie] {
        if let url = Bundle.main.url(forResource: "discover-movies", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                do {
                    let response = try JSONDecoder().decode(DiscoverMoviesResponse.self, from: data)
                    return response.results
                }
                catch {
                    print(error)
                }
            }
            catch {
                print(error)
            }
        }
        
        return [Movie]()
    }
}
