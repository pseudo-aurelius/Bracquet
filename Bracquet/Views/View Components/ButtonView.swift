//  ButtonView.swift
//  Copyright Bracquet 2024
//
//  This view component contains the app's standard button.
//  The button supports all Bracquet app colors and is written
//  to accept any closure as a callback.
//
//  Created by Drew Curtin on 8/27/24.

import SwiftUI

struct ButtonView: View {
    // Props
    let text: String
    let color: BracquetColors
    let tapCallback: () -> Void
    
    // Constructors - @escaping is required because the function closure will be called
    // after the constructor returns.
    init(text: String, color: BracquetColors, tapCallback: @escaping () -> Void) {
        self.text = text
        self.color = color
        self.tapCallback = tapCallback
    }
    
    var body: some View {
        Button(action: tapCallback) {
            Text(self.text)
                .font(Font.custom("Inter-SemiBold", size: 24))
                .foregroundColor(Color(hex: BracquetColors.pureBlack.rawValue))
                .lineLimit(1)
                .frame(width: getMaximumViewWidth(), height: 50)
                .background(Color(hex: self.color.rawValue))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: BracquetColors.accentBlack.rawValue), lineWidth: 3)
                )
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Click Here!", color: BracquetColors.primaryBlue) {
            print("Callback passed!");
        }
    }
}
