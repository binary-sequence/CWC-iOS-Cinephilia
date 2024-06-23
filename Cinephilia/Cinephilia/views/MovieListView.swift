//
//  MovieListView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 22.06.2024.
//

import SwiftUI

struct MovieListView: View {
    @Environment(MoviesViewModel.self) var model
    
    var body: some View {
        if let movies = model.movies {
            List {
                ForEach(movies.indices, id: \.self) { i in
                    if let movies = model.movies {
                        let m = movies[i]
                        HStack {
                            if let backdropPath = m.backdropPath {
                                let backdropURL = model.getBackdropURL(backdropPath: backdropPath)
                                AsyncImage(url: URL(string: backdropURL)) { image in
                                    image
                                        .resizable()
                                        .frame(width:50, height: 50)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            else {
                                Image(systemName: "movieclapper")
                                    .font(.largeTitle)
                            }
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(m.originalTitle)
                                        .bold()
                                    Spacer()
                                    if m.originalLanguage != "en" {
                                        let title = "(\(m.title))"
                                        Text(title)
                                    }
                                }
                                Text(m.releaseDate)
                            }
                        }
                        .onTapGesture {
                            model.selectedMovie = m
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}
