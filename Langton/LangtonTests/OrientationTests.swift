//
//  OrientationTests.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Langton

class OrientationTests: XCTestCase {
    func testNorthTurnLeft() {
        let result = Orientation.north.turn(.left)
        let expected: Orientation = .west
        XCTAssertEqual(result, expected)
    }

    func testNorthTurnRight() {
        let result = Orientation.north.turn(.right)
        let expected: Orientation = .east
        XCTAssertEqual(result, expected)
    }

    func testSouthTurnLeft() {
        let result = Orientation.south.turn(.left)
        let expected: Orientation = .east
        XCTAssertEqual(result, expected)
    }

    func testSouthTurnRight() {
        let result = Orientation.south.turn(.right)
        let expected: Orientation = .west
        XCTAssertEqual(result, expected)
    }
    func testWestTurnLeft() {
        let result = Orientation.west.turn(.left)
        let expected: Orientation = .south
        XCTAssertEqual(result, expected)
    }
    func testWestTurnRight() {
        let result = Orientation.west.turn(.right)
        let expected: Orientation = .north
        XCTAssertEqual(result, expected)
    }
    func testEastTurnLeft() {
        let result = Orientation.east.turn(.left)
        let expected: Orientation = .north
        XCTAssertEqual(result, expected)
    }
    func testEastTurnRight() {
        let result = Orientation.east.turn(.right)
        let expected: Orientation = .south
        XCTAssertEqual(result, expected)
    }
}
