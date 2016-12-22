//
//  GridTest.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Langton

class GridTests: XCTestCase {
    func testSubscript() {
        let grid = Grid(rows: 2, columns: 2, spots: [.black, .white, .black, .black])
        XCTAssertEqual(grid[0, 0], .black)
        XCTAssertEqual(grid[0, 1], .white)
        XCTAssertEqual(grid[1, 0], .black)
        XCTAssertEqual(grid[1, 1], .black)
    }

    func testLocationSubscript() {
        let grid = Grid(rows: 2, columns: 2, spots: [.black, .white, .black, .black])
        XCTAssertEqual(grid[Location(x: 0, y: 0)], .black)
        XCTAssertEqual(grid[Location(x: 0, y: 1)], .black)
        XCTAssertEqual(grid[Location(x: 1, y: 0)], .white)
        XCTAssertEqual(grid[Location(x: 1, y: 1)], .black)
    }

    func testFlip() {
        let grid = Grid(rows: 2, columns: 2, spots: [.black, .white, .black, .black])
        let result = grid.flippingSpot(at: Location(x: 0, y: 1))
        let expected = Grid(rows: 2, columns: 2, spots: [.black, .white, .white, .black])


        XCTAssertEqual(result, expected)
    }
}
