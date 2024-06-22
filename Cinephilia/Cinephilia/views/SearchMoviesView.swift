//
//  SearchMoviesView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 21.06.2024.
//

import SwiftUI

struct SearchMoviesView: View {
    @State var keywords = ""
    @State var years = 1900..<2034
    @State var selectedYear = Calendar.current.component(.year, from: Date())
    @FocusState var queryBoxFocused:Bool
    @State var showOptions = false
    
    var body: some View {
        VStack {
            Text("Search movies")
            
            TextField("Keywords", text: $keywords)
                .textFieldStyle(.roundedBorder)
                .focused($queryBoxFocused)
                .onTapGesture {
                    withAnimation {
                        showOptions = true
                    }
                }
            
            HStack {
                Text("From year")
                Picker("Year", selection: $selectedYear) {
                    ForEach(years, id: \.self) { year in
                        Text(String(year))
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SearchMoviesView()
}
