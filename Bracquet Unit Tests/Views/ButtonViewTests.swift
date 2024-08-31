//  ButtonViewTests.swift
//  Copyright 2024 Bracquet
//
//  This file contains the UI Unit tests for the Button View
//
//  Created by Drew Curtin on 8/30/24.

import XCTest
import SwiftUI
import ViewInspector
@testable import Bracquet


//      - Constructor test: callback passed successfully, works MUST
//      - Frame should be 50 pixels no matter what MAYBE

final class ButtonViewTests: XCTestCase {
    var expectedText: String?
    var expectedColorType: BraquetColors?
    
    override func setUpWithError() throws {
        expectedText = "Click Me!"
        expectedColorType = BraquetColors.primaryGreen
    }
    
    override func tearDownWithError() throws {
        expectedText = nil
        expectedColorType = nil
    }
    
    func test_constructor_text_sets_button_display_text() throws {
        // Test that the text string passed to the button constructor gets rendered as the button's display text        
        let buttonView = ButtonView(text: expectedText!, color: expectedColorType!) {}
        
        let buttonText = try buttonView.inspect().find(text: expectedText!)
        XCTAssertNotNil(buttonText) // The above line will throw if it returns no views, so this is a sufficient check
    }
    
    func test_button_display_text_has_custom_font() throws {
        // Test that the text displayed by the button has its custom font correct applied ("Inter-SemiBold")
        let expectedFontName = "Inter-SemiBold"
        
        let buttonView = ButtonView(text: expectedText!, color: expectedColorType!) {}
        
        let buttonText = try buttonView.inspect().find(text: expectedText!)
        let buttonTextFontName = try buttonText.attributes().font().name();
        XCTAssertEqual(buttonTextFontName, expectedFontName)
    }
    
    func test_constructor_color_sets_button_display_color() throws {
        // Test that the color passed to the button constructor is used to color the button
        let expectedColor = Color(hex: expectedColorType!.rawValue)
        let buttonView = ButtonView(text: expectedText!, color: expectedColorType!) {}
        
        let button = try buttonView.inspect().find(button: expectedText!)
        let buttonColor = try button.find(ViewType.HStack.self).background(0).color(0).value()
        XCTAssertEqual(buttonColor, expectedColor)
    }
    
    func test_constructor_closure_sets_button_tap_behavior() throws {
        // Test that the closure passed to the button constructor drives the tap behavior of the button
        var testState: Bool = false
        
        let buttonView = ButtonView(text: expectedText!, color: expectedColorType!) {
            testState.toggle()
        }
        
        let button = try buttonView.inspect().button()
        try button.tap()
        XCTAssertTrue(testState)
        try button.tap()
        XCTAssertFalse(testState)
    }
    
    func test_button_height_is_static() throws {
        // Test that the height of the button is always a static value (50 pixels)
        let expectedHeight: CGFloat = 50
        
        let buttonView = ButtonView(text: expectedText!, color: expectedColorType!) {}
        
        let buttonHeight = try buttonView.inspect().find(ViewType.HStack.self).fixedHeight()
        XCTAssertEqual(buttonHeight, expectedHeight)
    }
}
