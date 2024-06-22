//
//  SearchMoviesView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 21.06.2024.
//

import SwiftUI

struct SearchMoviesView: View {
    @Environment(MoviesViewModel.self) var model
    @State var query = ""
    @State var years = 1900..<2034
    @State var selectedYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        VStack {
            Text("Search movies")
            
            TextField("Search", text: $query)
                .textFieldStyle(.roundedBorder)
                .onChange(of: query) { oldValue, newValue in
                    if newValue.isEmpty {
                        model.movies = nil
                    }
                }
            
            HStack {
                Text("From year")
                Picker("Year", selection: $selectedYear) {
                    ForEach(years, id: \.self) { year in
                        Text(String(year))
                    }
                }
                
                Spacer()
                
                Button {
                    let userParams = [
                        "query=\(query)",
                        "year=\(selectedYear)"
                    ]
                    model.searchMovies(userParams: userParams)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
            
            if (query.isEmpty) {
                Text("search field is mandatory")
                    .foregroundStyle(Color.red)
            }
            else if let movies = model.movies {
                if movies.count == 0 {
                    Text("No movie found")
                }
                else {
                    MovieListView()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
