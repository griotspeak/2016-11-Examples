//
//  StandardGameTests.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/17.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

class StandardGameTests: XCTestCase {
    func testCellIsEmptyByDefault() {
        let result = StandardGame()
        let expected = Cell.empty

        XCTAssertEqual(result.currentState, expected)
    }

    func testOCannotPlayFirst() {
        let board = StandardGame()
        let result = board.place(.o, at: (1, 1))

        XCTAssertNil(result)
    }

    func testXCanPlayFirst() {
        let board = StandardGame()
        let result = board.place(.x, at: (1, 1))

        let expectedCell = Cell(rows: (
            Row<Cell.Space>(.u, .u, .u),
            Row<Cell.Space>(.u, .x, .u),
            Row<Cell.Space>(.u, .u, .u)))
        let expected = StandardGame(history: NonemptyList<Cell>(Cell.empty, [expectedCell]))

        XCTAssertNotNil(result)
        XCTAssertEqual(result, expected)
    }

    func testIsCompleteWhenDraw() {
        let history: NonemptyList<Cell> = NonemptyList(array:[
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .u, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.u, .x, .x),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.o, .x, .x),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.o, .x, .x),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.o, .x, .x),
                         Row<Cell.Space>(.u, .o, .o))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.o, .x, .x),
                         Row<Cell.Space>(.x, .o, .o)))])!

        let game = StandardGame(history: history)
        let result = game.isComplete
        let expected = true
        XCTAssertEqual(result, expected)
    }

    func testIsCompleteWhenXWins() {
        let history: NonemptyList<Cell> = NonemptyList(array:[
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.o, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.o, .u, .x))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.o, .u, .x))),
            Cell(rows: ( Row<Cell.Space>(.x, .o, .x),
                         Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.o, .u, .x))),
            ])!
        
        let game = StandardGame(history: history)
        let result = game.isComplete
        let expected = true
        XCTAssertEqual(result, expected)
    }

    func testIsCompleteWhenOWins() {
        let history: NonemptyList<Cell> = NonemptyList(array:[
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u))),

            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),

            Cell(rows: ( Row<Cell.Space>(.u, .u, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .o, .u))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .o, .o))),
            Cell(rows: ( Row<Cell.Space>(.x, .x, .o),
                         Row<Cell.Space>(.u, .x, .x),
                         Row<Cell.Space>(.o, .o, .o))),
            ])!

        let game = StandardGame(history: history)
        let result = game.isComplete
        let expected = true
        XCTAssertEqual(result, expected)
    }

    func testIsNotComplete() {
        let history: NonemptyList<Cell> = NonemptyList(array:[
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .u, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .u),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.u, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.o, .u, .u))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .u),
                         Row<Cell.Space>(.o, .u, .x))),
            Cell(rows: ( Row<Cell.Space>(.u, .o, .x),
                         Row<Cell.Space>(.u, .x, .o),
                         Row<Cell.Space>(.o, .u, .x))),
            ])!

        let game = StandardGame(history: history)
        let result = game.isComplete
        let expected = false
        XCTAssertEqual(result, expected)
    }
}









