//
//  ComparisonTests.swift
//  SortingHat
//
//  Created by TJ Usiyan on 2016/12/02.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import SortingHat

class ComparisonTests: XCTestCase {
    func testCompareTwoInts() {
        XCTAssertEqual(compare(0, 1), .orderedAscending)
        XCTAssertEqual(compare(1, 1), .orderedSame)
        XCTAssertEqual(compare(1, 0), .orderedDescending)
    }

    func testCompareTwoSingleItemArrays() {
        XCTAssertEqual(compare([0], [1]), .orderedAscending)
        XCTAssertEqual(compare([1], [1]), .orderedSame)
        XCTAssertEqual(compare([1], [0]), .orderedDescending)
    }

    func testCompareTwoTwoItemArrays() {
        XCTAssertEqual(compare([0, 1], [1, 0]), .orderedAscending)
        XCTAssertEqual(compare([1, 1], [1, 1]), .orderedSame)
        XCTAssertEqual(compare([1, 0], [1, 3]), .orderedDescending)
    }
}
