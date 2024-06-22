//
//  OnBoardingDetailsView.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 21.06.2024.
//

import SwiftUI

struct OnboardingDetailsView: View {
    let bgColor: Color
    let fgColor: Color
    let headline: String
    let screenshot: String
    let buttonAction: ()->Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            
            VStack(spacing: 0) {
                Spacer()
                
                Text(headline)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(fgColor)
                
                Spacer()
                
                Image(screenshot)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                        
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    OnboardingDetailsView(bgColor: Color(red: 3/255, green: 37/255, blue: 65/255), fgColor: Color(red: 106/255, green: 202/255, blue: 214/255), headline: "Discover new releases", screenshot: "discover-new-releases") {
        // Do nothing
    }
}
