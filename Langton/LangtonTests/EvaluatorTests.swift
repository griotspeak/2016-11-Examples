//
//  EvaluatorTests.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Langton

class EvaluatorTests: XCTestCase {
    func testStepFromBlack() {
        let ant = Ant(at: Location(x: 1, y: 1), facing: .north)
        let grid = Grid(rows: 3, columns: 3, spots: Array(repeating: .black, count: 9))
        let result = Evaluator.step(state: (ant, grid))
        let expectedGrid = grid.flippingSpot(at: Location(x: 1, y: 1))
        let expectedAnt = Ant(at: Location(x: 0, y: 1), facing: .west)
        let expected: Evaluator.State = (expectedAnt, expectedGrid)
        XCTAssertTrue(result == expected)
    }
}
