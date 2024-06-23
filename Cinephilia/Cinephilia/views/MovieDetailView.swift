//
//  MovieDetailView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 22.06.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(MoviesViewModel.self) var model
    
    var body: some View {
        let movie = model.selectedMovie
        
        VStack {
            if let backdropPath = movie?.backdropPath {
                let backdropURL = model.getBackdropURL(backdropPath: backdropPath)
                AsyncImage(url: URL(string: backdropURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }
            }
            else {
                Image(systemName: "film")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
            }
            
            Text(movie?.title ?? "")
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading) {
                Text("Title: \(movie?.title ?? "")")
                Text("Original title: \(movie?.originalTitle ?? "")")
                Text("Release date: \(movie?.releaseDate ?? "")")
            }
            
            Spacer()
        }
        .padding()
    }
}
