//
//  HomeView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 17.06.2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(MoviesViewModel.self) var model
    
    var body: some View {
        VStack {
            ForEach(model.movies) { m in
                Text(m.originalTitle)
            }
        }
        .onAppear {
            model.discoverMovies()
        }
    }
}

#Preview {
    HomeView()
}
