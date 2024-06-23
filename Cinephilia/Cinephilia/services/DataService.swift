//
//  DataServices.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import Foundation

struct DataService {
    let apiToken = (Bundle.main.infoDictionary!["API_TOKEN"]! as? String)!
    let apiHost = "https://api.themoviedb.org"
    let defaultParams = [
        "include_adult=false",
        "language=en-US",
        "page=1"
    ].joined(separator: "&")
    
    private func getMovies(endpoint: String) async -> [Movie] {
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(response)
                let result = try JSONDecoder().decode(TMDBResponse.self, from: data)
                return result.results
            }
            catch {
                print(error)
            }
        }
        
        return [Movie]()
    }
    
    func getNewReleases() async -> [Movie] {
        let today = StringFormatter.getFormatted(date: Date())
        let params = [
            "include_video=false",
            "primary_release_date.gte=\(today)",
            "sort_by=primary_release_date.asc"
        ].joined(separator: "&")
        let endpoint = "\(apiHost)/3/discover/movie?\(defaultParams)&\(params)"
        
        return await getMovies(endpoint: endpoint)
    }
    
    func searchMovies(userParams: String) async -> [Movie] {
        let endpoint = "\(apiHost)/3/search/movie?\(defaultParams)&\(userParams)"
        
        return await getMovies(endpoint: endpoint)
    }
}
