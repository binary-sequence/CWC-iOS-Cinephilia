//
//  OnBoardingView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 19.06.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedViewIndex) {
                    let darkColor = Color(red: 3/255, green: 37/255, blue: 65/255)
                    let lightColor = Color(red: 106/255, green: 202/255, blue: 214/255)
                    
                    OnboardingDetailsView(bgColor: darkColor, fgColor: lightColor, headline: "Discover the latest releases", screenshot: "discover-new-releases") {
                        withAnimation {
                            selectedViewIndex = 1
                        }
                    }
                    .tag(0)
                    .ignoresSafeArea()
                    
                    OnboardingDetailsView(bgColor: lightColor, fgColor: darkColor, headline: "Search details about your favorite movies", screenshot: "search-movies") {
                        dismiss()
                    }
                    .tag(1)
                    .ignoresSafeArea()
                }
                .tabViewStyle(.page)
            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
