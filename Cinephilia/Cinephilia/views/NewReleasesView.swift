//
//  NewReleasesView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 21.06.2024.
//

import SwiftUI

struct NewReleasesView: View {
    @Environment(MoviesViewModel.self) var model
    
    var body: some View {
        VStack {
            Text("New releases")
                .font(.largeTitle)
                .bold()
            
            if let movies = model.movies {
                if movies.count == 0 {
                    Text("No movie found")
                }
                else {
                    MovieListView()
                }
            }
        }
    }
}
