//
//  CellTests.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/13.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

class CellTests: XCTestCase {

    // MARK: - Placement
    // MARK: X
    // MARK: placement - Row 0
    func testPlaceXMarkerRow0Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 0, column: 0)

        let expected = Cell(rows: (Row(.x, .empty, .empty), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }

    func testPlaceXMarkerRow0Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 0, column: 1)

        let expected = Cell(rows: (Row(.empty, .x, .empty), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }
    func testPlaceXMarkerRow0Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 0, column: 2)

        let expected = Cell(rows: (Row(.empty, .empty, .x), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }

    // MARK: placement - Row 1
    func testPlaceXMarkerRow1Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 1, column: 0)

        let expected = Cell(rows: (.defaultValue, Row(.x, .empty, .empty), .defaultValue))
        XCTAssertEqual(result, expected)
    }

    func testPlaceXMarkerRow1Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 1, column: 1)

        let expected = Cell(rows: (.defaultValue, Row(.empty, .x, .empty), .defaultValue))
        XCTAssertEqual(result, expected)
    }
    func testPlaceXMarkerRow1Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 1, column: 2)

        let expected = Cell(rows: (.defaultValue, Row(.empty, .empty, .x), .defaultValue))
        XCTAssertEqual(result, expected)
    }

    // MARK: placement - Row 2
    func testPlaceXMarkerRow2Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 2, column: 0)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.x, .empty, .empty)))
        XCTAssertEqual(result, expected)
    }

    func testPlaceXMarkerRow2Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 2, column: 1)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.empty, .x, .empty)))
        XCTAssertEqual(result, expected)
    }
    func testPlaceXMarkerRow2Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .x, row: 2, column: 2)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.empty, .empty, .x)))
        XCTAssertEqual(result, expected)
    }

    func testPlaceOMarkerRow0Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 0, column: 0)

        let expected = Cell(rows: (Row(.o, .empty, .empty), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }

    func testPlaceOMarkerRow0Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 0, column: 1)

        let expected = Cell(rows: (Row(.empty, .o, .empty), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }
    func testPlaceOMarkerRow0Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 0, column: 2)

        let expected = Cell(rows: (Row(.empty, .empty, .o), .defaultValue, .defaultValue))
        XCTAssertEqual(result, expected)
    }

    // MARK: placement - Row 1
    func testPlaceOMarkerRow1Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 1, column: 0)

        let expected = Cell(rows: (.defaultValue, Row(.o, .empty, .empty), .defaultValue))
        XCTAssertEqual(result, expected)
    }

    func testPlaceOMarkerRow1Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 1, column: 1)

        let expected = Cell(rows: (.defaultValue, Row(.empty, .o, .empty), .defaultValue))
        XCTAssertEqual(result, expected)
    }
    func testPlaceOMarkerRow1Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 1, column: 2)

        let expected = Cell(rows: (.defaultValue, Row(.empty, .empty, .o), .defaultValue))
        XCTAssertEqual(result, expected)
    }

    // MARK: placement - Row 2
    func testPlaceOMarkerRow2Column0() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 2, column: 0)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.o, .empty, .empty)))
        XCTAssertEqual(result, expected)
    }

    func testPlaceOMarkerRow2Column1() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 2, column: 1)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.empty, .o, .empty)))
        XCTAssertEqual(result, expected)
    }
    func testPlaceOMarkerRow2Column2() {
        let board: Cell = Cell()
        let result = board.place(marker: .o, row: 2, column: 2)

        let expected = Cell(rows: (.defaultValue, .defaultValue, Row(.empty, .empty, .o)))
        XCTAssertEqual(result, expected)
    }

    func testCannotPlaceOnOccupiedCoordinate() {
        let board = Cell(rows: (Row(.empty, .x, .empty), .defaultValue, .defaultValue))
        let result = board.place(marker: .x, row: 0, column: 1)

        let expected: Cell? = nil
        XCTAssertEqual(result, expected)
    }

    // MARK: - Available

    func testAvailable() {
        let board = Cell(rows: (Row(.empty, .x, .empty), .defaultValue, Row(.o, .x, .empty)))

        let openSpots = [(0, 0),         (0, 2),
                         (1, 0), (1, 1), (1, 2),
                                         (2, 2)]
        for (x, y) in openSpots {
            XCTAssertTrue(board.isAvailable(row: x, col: y))
        }
    }

    func testDescription() {
        let board = Cell(rows: (
            Row(.o, .x, .empty),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let result = board.description


        let expected: String = {
            var string = ""
            string.append("           \n")
            string.append(" o | x |   \n")
            string.append("---+---+---\n")
            string.append(" x | o | o \n")
            string.append("---+---+---\n")
            string.append(" o | x | x \n")
            string.append("           ")
            return string
        }()

        XCTAssertEqual(result, expected)
    }

    func testSubscriptGetter() {
        let board = Cell(rows: (
            Row(.o, .x, .empty),
            Row(.x, .o, .empty),
            Row(.o, .x, .empty)))

        XCTAssertEqual(board[0, 0], .o)
        XCTAssertEqual(board[0, 1], .x)
        XCTAssertEqual(board[0, 2], .empty)

        XCTAssertEqual(board[1, 0], .x)
        XCTAssertEqual(board[1, 1], .o)
        XCTAssertEqual(board[1, 2], .empty)

        XCTAssertEqual(board[2, 0], .o)
        XCTAssertEqual(board[2, 1], .x)
        XCTAssertEqual(board[2, 2], .empty)
    }
}

