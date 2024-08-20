//  HexColorsTests.swift
//  Copyright 2024 Bracquet
//
//  This file contains unit tests for the functions that extend Swift UI color to
//  allow for hex values.
//
//  Created by Drew Curtin on 8/16/24.


import XCTest
@testable import Bracquet

final class HexColorsTests: XCTestCase {

    func test_six_digit_hex_maps_to_correct_rgba() throws {
        // Verify that 6 digit hex inputs map to their correct values in rgb
        var expectedRed, expectedGreen, expectedBlue, expectedOpacity: Double
        
        // Test Case #1 - Pure Black: #000000 maps to rgba of (0, 0, 0, 1)
        expectedRed = 0
        expectedGreen = 0
        expectedBlue = 0
        expectedOpacity = 1
        
        var (actualOpacity, actualRed, actualGreen, actualBlue) = convertHexToRGBA(hexString: BraquetColors.pureBlack)
        
        XCTAssertEqual(actualOpacity, expectedOpacity)
        XCTAssertEqual(actualGreen, expectedGreen)
        XCTAssertEqual(actualBlue, expectedBlue)
        XCTAssertEqual(actualRed, expectedRed)
        
        // Test Case #2 - App Primary Blue: #6699CC maps to rgba of
        expectedRed = 102 / 255
        expectedGreen = 153 / 255
        expectedBlue = 204 / 255
        expectedOpacity = 1
        
        (actualOpacity, actualRed, actualGreen, actualBlue) = convertHexToRGBA(hexString: BraquetColors.primaryBlue)
        
        XCTAssertEqual(actualOpacity, expectedOpacity)
        XCTAssertEqual(actualGreen, expectedGreen)
        XCTAssertEqual(actualBlue, expectedBlue)
        XCTAssertEqual(actualRed, expectedRed)
        
    }

}
