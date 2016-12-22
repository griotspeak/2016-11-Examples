//
//  SpotTests.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Langton

class SpotTests: XCTestCase {
    func testInvert() {
        XCTAssertEqual(Spot.black.flipped, Spot.white)
        XCTAssertEqual(Spot.white.flipped, Spot.black)
    }
}

