//  HeaderView.swift
//  Copyright Bracquet 2024
//
//  This view component represents the header for the
//  app, which contains the app's logo and title text.
//
//  Created by Drew Curtin on 8/11/24.

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack() {

            Image("Bracquet Icon")
                .padding(.leading, 25)
            
            Spacer()
            
            Text("Bracquet")
                .font(Font.custom("Inter-Bold", size: 60))
                .foregroundColor(Color(hex: BraquetColors.pureBlack))
                .padding(.trailing, 25)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
