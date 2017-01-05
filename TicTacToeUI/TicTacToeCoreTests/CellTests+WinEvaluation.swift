//
//  CellTests+WinEvaluation.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/16.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

extension CellTests {

    // MARK: X Rows
    func testXWinsTopRow() {
        let board = Cell(rows: (
            Row(.x, .x, .x),
            Row(.o, .x, .u),
            Row(.u, .o, .o))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    func testXWinsMiddleRow() {
        let board = Cell(rows: (
            Row(.o, .x, .u),
            Row(.x, .x, .x),
            Row(.u, .o, .o)))
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    func testXWinsBottomRow() {
        let board = Cell(rows: (
            Row(.u, .o, .o),
            Row(.o, .x, .u),
            Row(.x, .x, .x)))
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    // MARK: X Columns
    func testXWinsLeftColumn() {
        let board = Cell(rows: (
            Row(.x, .o, .o),
            Row(.x, .x, .o),
            Row(.x, .u, .u))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    func testXWinsMiddleColumn() {
        let board = Cell(rows: (
            Row(.u, .x, .o),
            Row(.o, .x, .o),
            Row(.x, .x, .u))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    func testXWinsRightColumn() {
        let board = Cell(rows: (
            Row(.o, .o, .x),
            Row(.o, .x, .x),
            Row(.u, .u, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    // MARK: X Diagonals

    func testXWinsAscending() {
        let board = Cell(rows: (
            Row(.u, .o, .x),
            Row(.u, .x, .o),
            Row(.x, .x, .o))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    func testXWinsDescending() {
        let board = Cell(rows: (
            Row(.x, .x, .o),
            Row(.u, .x, .o),
            Row(.u, .o, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .x

        XCTAssertEqual(result, expected)
    }

    // MARK: O Rows
    func testOWinsTopRow() {
        let board = Cell(rows: (
            Row(.o, .o, .o),
            Row(.x, .o, .u),
            Row(.u, .x, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    func testOWinsMiddleRow() {
        let board = Cell(rows: (
            Row(.x, .o, .u),
            Row(.o, .o, .o),
            Row(.u, .x, .x)))

        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    func testOWinsBottomRow() {
        let board = Cell(rows: (
            Row(.u, .x, .x),
            Row(.x, .o, .u),
            Row(.o, .o, .o)))
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    // MARK: O Columns
    func testOWinsLeftColumn() {
        let board = Cell(rows: (
            Row(.o, .x, .x),
            Row(.o, .o, .x),
            Row(.o, .u, .u))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    func testOWinsMiddleColumn() {
        let board = Cell(rows: (
            Row(.u, .o, .x),
            Row(.x, .o, .x),
            Row(.o, .o, .u))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    func testOWinsRightColumn() {
        let board = Cell(rows: (
            Row(.x, .x, .o),
            Row(.x, .o, .o),
            Row(.u, .u, .o))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    // MARK: O Diagonals

    func testOWinsAscending() {
        let board = Cell(rows: (
            Row(.u, .x, .o),
            Row(.u, .o, .x),
            Row(.o, .o, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .o

        XCTAssertEqual(result, expected)
    }

    func testOWinsDescending() {
        let board = Cell(rows: (
            Row(.o, .o, .x),
            Row(.u, .o, .x),
            Row(.u, .x, .o))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .o
        
        XCTAssertEqual(result, expected)
    }

    // Mark: Draw 
    func testDraw() {
        let board = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.x, .o, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: true)
        let expected: CellStatus = .draw

        XCTAssertEqual(result, expected)
    }

    // Mark: Undecided
    func testUndecided() {
        let board = Cell(rows: (
            Row(.o, .x, .o),
            Row(.u, .x, .o),
            Row(.x, .o, .x))
        )
        let result = board.winner(drawCountsForEitherPlayer: false)
        let expected: CellStatus = .undecided

        XCTAssertEqual(result, expected)
    }
}
