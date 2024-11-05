//  StartupViewSnapshotTests.swift
//  Copyright 2024 Bracquet
//
//  This file contains the UI Snapshot Tests for the Startup View.
//  Fundamentally, these tests ensure that the static rendering of
//  the view does not regress as changes to the code are made.
//
//  Created by Drew Curtin on 11/3/24

import XCTest
import SnapshotTesting
import SwiftUI
@testable import Bracquet

final class StartupViewSnapshotTests: XCTestCase {
    func test_startup_view_rendering_common() throws {
        // Test that the current rendering of the startup view on a very common iPhone (the 13, released 2021)
        // matches the accepted baseline.
        let startupView = StartupView()
        let hostingController = UIHostingController(rootView: startupView)
        
        withSnapshotTesting(record: .none) { // Use record: .all to record new baseline, .none to run test against existing baseline
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13), named: "StartupView_Baseline")
        }
    }
}
