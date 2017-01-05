//
//  ThreeByThreeTests.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/19.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

class ThreeByThreeTests: XCTestCase {
    func testCoordinates() {
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 0)! == (row: 0, column: 0))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 1)! == (row: 0, column: 1))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 2)! == (row: 0, column: 2))

        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 3)! == (row: 1, column: 0))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 4)! == (row: 1, column: 1))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 5)! == (row: 1, column: 2))

        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 6)! == (row: 2, column: 0))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 7)! == (row: 2, column: 1))
        XCTAssertTrue(ThreeByThree<Void>.coordinates(index: 8)! == (row: 2, column: 2))

        XCTAssertNil(ThreeByThree<Void>.coordinates(index: -1))
        XCTAssertNil(ThreeByThree<Void>.coordinates(index: 9))
        XCTAssertNil(ThreeByThree<Void>.coordinates(index: 1000))

    }
}
