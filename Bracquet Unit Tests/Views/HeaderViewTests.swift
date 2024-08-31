//  HeaderViewTests.swift
//  Copyright 2024 Bracquet
//
//  This file contains the UI Unit tests for the Header View
//
//  Created by Drew Curtin on 8/15/24.

import XCTest
import SwiftUI
import ViewInspector
@testable import Bracquet

final class HeaderViewTests: XCTestCase {
    var headerView: HeaderView?

    override func setUpWithError() throws {
        // Before each
        headerView = HeaderView()
    }
    
    override func tearDownWithError() throws {
        // After each
        headerView = nil;
    }
    
    func test_logo_and_title_exist_in_view() throws {
        // When the header view is rendered, it should have both a logo and title text
        let hStack = try headerView.inspect().hStack()
        
        // Validate logo existence
        let logoExistence = try !hStack.image(0).isHidden()
        XCTAssertTrue(logoExistence)
        
        // Validate title existence
        let titleExistemce = try !hStack.text(2).isHidden()
        XCTAssertTrue(titleExistemce)
    }
    
    func test_logo_displays_assets_image() throws {
        // When the logo is rendered, it should display the proper image from assets
        let expectedImageName = "Bracquet Icon"
        let hStack = try headerView.inspect().hStack()
        
        // We are attempting to render the correct asset
        let logoImage = try hStack.image(0).actualImage().name()
        XCTAssertEqual(logoImage, expectedImageName)
    }
    
    func test_title_has_custom_font() throws {
        // When the title is rendered, it should have the app's custom font ("Inter")
        let expectedFontName = "Inter-Bold"
        let hStack = try headerView.inspect().hStack()
        
        // We are attempting to render the correct font
        let titleFontName = try hStack.text(2).attributes().font().name()
        XCTAssertEqual(titleFontName, expectedFontName)
    }
    
    func test_title_has_black_font_color() throws {
        // When the title is rendered, it should have a pure black font color (#000000)
        let expectedColor = Color(hex: BraquetColors.pureBlack.rawValue)
        let hStack = try headerView.inspect().hStack()
        
        let titleFontColor = try hStack.text(2).attributes().foregroundColor()
        XCTAssertEqual(titleFontColor, expectedColor)
    }
}
