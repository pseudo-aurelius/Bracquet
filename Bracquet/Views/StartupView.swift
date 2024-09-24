//  StartupView.swift
//  Copyright Bracquet 2024
//
//  This parent view will serve as the first screen
//  users are greeted by when opening the Bracquet App.
//  Functionally, this view will allow users to proceed
//  to either logging in or signing up.
//
//  Created by Drew Curtin on 8/31/24.

import SwiftUI

struct StartupView: View {
    var body: some View {
        ZStack() {
            Color(hex: BracquetColors.backgroundWhite.rawValue)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HeaderView()
                        .padding(.bottom, -10)
                    
                    Text("The Official Tennis Tournament Challenge")
                        .font(Font.custom("Inter-SemiBold", size: 18))
                        .foregroundColor(Color(hex: BracquetColors.pureBlack.rawValue))
                        .lineLimit(1)
                }
                .frame(width: getCurrentScreenWidth())
                .padding(.top, 15)
                .padding(.bottom, 5)

                Image("Tennis Stadium")
                    .resizable()
                    .scaledToFit()
                    .border(Color(hex: BracquetColors.accentBlack.rawValue), width: 5)
                    .frame(width: getMaximumViewWidth())
                    .padding(.bottom, 5)
                
                Text("Compete with friends, family, and tennis fanatics all over the world to see who can pick them the best!")
                    .font(Font.custom("Inter-Regular", size: 18))
                    .foregroundColor(Color(hex: BracquetColors.pureBlack.rawValue))
                    .lineLimit(3)
                    .frame(width: getMaximumViewWidth())
                    .padding(.bottom, 20)
                
                ButtonView(text: "Login", color: BracquetColors.primaryBlue) {

                }
                .padding(.bottom, 5)

                ButtonView(text: "Sign Up", color: BracquetColors.primaryGreen) {

                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
