//
//  CinephiliaApp.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 16.06.2024.
//

import SwiftUI

@main
struct CinephiliaApp: App {
    @State var model = MoviesViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
        }
    }
}
