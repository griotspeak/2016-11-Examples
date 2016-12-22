//
//  LocationTests.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Langton

class LocationTests: XCTestCase {
    func testMove() {
        let origin = Location(x: 0, y: 0)

        XCTAssertTrue(Location(2, .north, from: origin) == Location(x: 0, y:  2))
        XCTAssertTrue(Location(2, .south, from: origin) == Location(x: 0, y: -2))
        XCTAssertTrue(Location(2, .east, from: origin) == Location(x:  2, y: 0))
        XCTAssertTrue(Location(2, .west, from: origin) == Location(x: -2, y: 0))
    }
}
