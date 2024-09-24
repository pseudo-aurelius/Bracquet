//  ScreenUtils.swift
//  Copyright 2024 Bracquet
//
//  This global module provides quick, standard ways to get
//  the current width and height of the screen. This can be
//  incredibly useful for placing views.
//
//  Created by Drew Curtin on 9/7/24.

import SwiftUI

func getMaximumViewWidth() -> CGFloat {
    // This returns a standard value representing the
    // max width a Swift UI view in the app should have
    let standardMargin: CGFloat = 30;
    
    return getCurrentScreenWidth() - standardMargin;
}

func getCurrentScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.width
}

func getCurrentScreenHeight() -> CGFloat {
    return UIScreen.main.bounds.height
}
