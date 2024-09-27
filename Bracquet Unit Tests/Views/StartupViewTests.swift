//  StartupViewTests.swift
//  Copyright 2024 Bracquet
//
//  This file contains the UI Unit tests for the Startup View
//
//  Created by Drew Curtin on 9/7/24.

import XCTest
import SwiftUI
import ViewInspector
@testable import Bracquet

final class StartupViewTests: XCTestCase {
    var startupView: StartupView?
    
    override func setUpWithError() throws {
        startupView = StartupView()
    }
    
    override func tearDownWithError() throws {
        startupView = nil
    }
    
    func test_startup_background_color() throws {
        // Test that the startup view provides a background to all its child views that is of color "background white"
        let expectedBackgroundColor = Color(hex: BracquetColors.backgroundWhite.rawValue)
        
        let colorBackground = try startupView.inspect().navigationView().zStack(0).color(0).value()
        XCTAssertEqual(colorBackground, expectedBackgroundColor)
    }
    
    func test_startup_banner_subtitle_has_correct_font_type() throws {
        // Test that the banner's subtitle is assigned the correct custom font ("Inter-SemiBold")
        let expectedFontName = "Inter-SemiBold"
        let bannerText = "The Official Tennis Tournament Challenge"
        
        let bannerSubtitle = try startupView.inspect().find(text: bannerText)
        let bannerSubtitleFontName = try bannerSubtitle.attributes().font().name()
        XCTAssertEqual(bannerSubtitleFontName, expectedFontName)
    }
    
    func test_startup_banner_can_occupy_full_screen_width() throws {
        // Test that the banner has the potential to occupy the current screen's entire width
        let expectedMaxWidth = getCurrentScreenWidth()
        let bannerText = "The Official Tennis Tournament Challenge"
        
        let banner = try startupView.inspect().find(ViewType.VStack.self, containing: bannerText)
        let bannerMaxWidth = try banner.fixedWidth()
        XCTAssertEqual(bannerMaxWidth, expectedMaxWidth)
    }
    
    func test_startup_image_renders_to_screen() throws {
        // Test that the startup image view renders the correct image from assets to the screen
        let expectedAssetName = "Tennis Stadium"
        
        let startupImage = try startupView.inspect().find(ViewType.Image.self) {
            try $0.actualImage().name() == expectedAssetName
        }
        
        XCTAssertNotNil(startupImage)
    }
    
    func test_startup_image_width_is_dynamically_constrained() throws {
        // Test that the startup image has the potential to occupy the max width allowed to Swift UI views
        let expectedMaxWidth = getMaximumViewWidth()
        let imageAssetName = "Tennis Stadium"
        
        let startupImage = try startupView.inspect().find(ViewType.Image.self) {
            try $0.actualImage().name() == imageAssetName
        }
        
        let startupImageMaxWidth = try startupImage.fixedWidth()
        XCTAssertEqual(startupImageMaxWidth, expectedMaxWidth)
    }
    
    func test_startup_image_is_centered() throws {
        // Test that the startup image is centered in its parent view
        let expectedAlignment = Alignment.center.horizontal
        let imageAssetName = "Tennis Stadium"
        
        let startupImage = try startupView.inspect().find(ViewType.Image.self) {
            try $0.actualImage().name() == imageAssetName
        }
        
        let startupImageAlignment = try startupImage.fixedAlignment().horizontal
        XCTAssertEqual(startupImageAlignment, expectedAlignment)
    }
    
    func test_call_to_action_text_has_correct_font_type() throws {
        // Test that the call to action is assigned the correct custom font ("Inter-Regular")
        let expectedFontName = "Inter-Regular"
        let callToActionText = "Compete with friends, family, and tennis fanatics all over the world to see who can pick them the best!"
        
        let callToAction = try startupView.inspect().find(text: callToActionText)
        let callToActionFontName = try callToAction.attributes().font().name()
        XCTAssertEqual(callToActionFontName, expectedFontName)
    }
    
    func test_call_to_action_text_is_dynamically_constrained() throws {
        // Test that the call to action has the potential to occupy the max width allowed to Swift UI views
        let expectedMaxWidth = getMaximumViewWidth()
        let callToActionText = "Compete with friends, family, and tennis fanatics all over the world to see who can pick them the best!"
        
        let callToAction = try startupView.inspect().find(text: callToActionText)
        let callToActionMaxWidth = try callToAction.fixedWidth()
        XCTAssertEqual(callToActionMaxWidth, expectedMaxWidth)
    }
    
    func test_call_to_action_text_is_centered() throws {
        // Test that the call to action is centered in its parent view
        let expectedAlignment = Alignment.center.horizontal
        let callToActionText = "Compete with friends, family, and tennis fanatics all over the world to see who can pick them the best!"
        
        let callToAction = try startupView.inspect().find(text: callToActionText)
        let callToActionAlignment = try callToAction.fixedAlignment().horizontal
        XCTAssertEqual(callToActionAlignment, expectedAlignment)
    }
    
    func test_signup_button_tap_updates_navigation_state() throws {
        // Test that tapping the signup button programatically triggers
        // an update to its associated state variable
        let stateTest = startupView!.on(\.didAppear) { startupView in
            let initialNavigationState =  try startupView.actualView().navigateToSignup
            XCTAssertFalse(initialNavigationState)
            
            let signupButton = try startupView.find(button: "Sign Up")
            try signupButton.tap()
            
            let finalNavigationState = try startupView.actualView().navigateToSignup
            XCTAssertTrue(finalNavigationState)
        }
        
        ViewHosting.host(view: startupView!)
        wait(for: [stateTest], timeout: 5)
    }
}
