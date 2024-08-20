//  HexColors.swift
//  Copyright 2024 Bracquet
//
//  This file extends Swift UI Color to allow for hex value inputs.
//
//  Created by Drew Curtin on 8/11/24.

import SwiftUI

extension Color {
    init(hex: String) {
        let a, r, g, b: Double
        
        (a, r, g, b) = convertHexToRGBA(hexString: hex)
        
        self.init(
            .sRGB,
            red: r,
            green: g,
            blue: b,
            opacity: a
        )
    }
}

func convertHexToRGBA(hexString: String) -> (a: Double, r: Double, g: Double, b: Double) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var hexInt: UInt64 = 0
    
    Scanner(string: hex).scanHexInt64(&hexInt)
    
    let a, r, g, b: UInt64
    
    switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (hexInt >> 8) * 17, (hexInt >> 4 & 0xF) * 17, (hexInt & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, hexInt >> 16, hexInt >> 8 & 0xFF, hexInt & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (hexInt >> 24, hexInt >> 16 & 0xFF, hexInt >> 8 & 0xFF, hexInt & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
    }
    
    return (Double(a) / 255, Double(r) / 255, Double(g) / 255, Double(b) / 255)
}
