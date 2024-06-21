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
        TabView {
            NewReleasesView()
                .tag(0)
                .tabItem {
                    Label("Releases", systemImage: "calendar.circle")
                }
        }
        .onAppear {
            model.discoverMovies()
        }
    }
}
