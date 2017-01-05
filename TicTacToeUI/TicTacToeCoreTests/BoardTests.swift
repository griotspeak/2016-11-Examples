//
//  BoardTests.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/16.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

class BoardTests: XCTestCase {
    func testDescription() {
        let cell0 = Cell(rows: (
            Row(.o, .u, .u),
            Row(.u, .o, .u),
            Row(.u, .u, .o)))
        let cell1 = Cell(rows: (
            Row(.u, .o, .u),
            Row(.u, .o, .u),
            Row(.u, .o, .u)))
        let cell2 = Cell(rows: (
            Row(.u, .u, .o),
            Row(.u, .o, .u),
            Row(.o, .u, .u)))

        let cell3 = Cell(rows: (
            Row(.x, .u, .x),
            Row(.u, .x, .u),
            Row(.x, .u, .x)))
        let cell4 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell5 = Cell(rows: (
            Row(.o, .u, .o),
            Row(.u, .o, .u),
            Row(.o, .u, .o)))

        let cell6 = Cell(rows: (
            Row(.u, .u, .x),
            Row(.u, .x, .u),
            Row(.x, .u, .u)))
        let cell7 = Cell(rows: (
            Row(.u, .x, .u),
            Row(.u, .x, .u),
            Row(.u, .x, .u)))
        let cell8 = Cell(rows: (
            Row(.x, .u, .u),
            Row(.u, .x, .u),
            Row(.u, .u, .x)))
        let board = Board(rows: (
            Row(cell0, cell1, cell2),
            Row(cell3, cell4, cell5),
            Row(cell6, cell7, cell8)))
        let result = board.description

        let expected: String = {

            // ‖
            var string = ""
            string.append(            "0↓ ========== 1↓ ========== 2↓ ========== \n")
            string.append(            "                                          \n")
            string.append(            "   o |   |    #    | o |    #    |   | o  \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "     | o |    #    | o |    #    | o |    \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "     |   | o  #    | o |    #  o |   |    \n")
            string.append(            "                                          \n")
            string.append(            "3↓ ========== 4↓ ========== 5↓ ========== \n")
            string.append(            "                                          \n")
            string.append(            "   x |   | x  #    |   |    #  o |   | o  \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "     | x |    #    |   |    #    | o |    \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "   x |   | x  #    |   |    #  o |   | o  \n")
            string.append(            "                                          \n")
            string.append(            "6↓ ========== 7↓ ========== 8↓ ========== \n")
            string.append(            "                                          \n")
            string.append(            "     |   | x  #    | x |    #  x |   |    \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "     | x |    #    | x |    #    | x |    \n")
            string.append(            "  ---+---+--- # ---+---+--- # ---+---+--- \n")
            string.append(            "   x |   |    #    | x |    #    |   | x  \n")
            string.append(            "                                          \n")

            return string
        }()

        XCTAssertEqual(result, expected)
    }

    func testCellRepresentation() {
        let cell0 = Cell(rows: (
            Row(.o, .u, .u),
            Row(.u, .o, .u),
            Row(.u, .u, .o)))
        let cell1 = Cell(rows: (
            Row(.u, .o, .u),
            Row(.u, .o, .u),
            Row(.u, .o, .u)))
        let cell2 = Cell(rows: (
            Row(.u, .u, .o),
            Row(.u, .o, .u),
            Row(.o, .u, .u)))

        let cell3 = Cell(rows: (
            Row(.x, .o, .x),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let cell4 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell5 = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))

        let cell6 = Cell(rows: (
            Row(.u, .u, .x),
            Row(.u, .x, .u),
            Row(.x, .u, .u)))
        let cell7 = Cell(rows: (
            Row(.u, .x, .u),
            Row(.u, .x, .u),
            Row(.u, .x, .u)))
        let cell8 = Cell(rows: (
            Row(.x, .u, .u),
            Row(.u, .x, .u),
            Row(.u, .u, .x)))

        let board = Board(rows: (
            Row(cell0, cell1, cell2),
            Row(cell3, cell4, cell5),
            Row(cell6, cell7, cell8)))
        let resultWithDraws = board.cellRepresentation(drawCountsForEitherPlayer: true)
        let resultWithoutDraws = board.cellRepresentation(drawCountsForEitherPlayer: false)
        let expected = ThreeByThree<CellStatus>((
            Row<CellStatus>(.o, .o, .o),
            Row<CellStatus>(.draw, .undecided, .draw),
            Row<CellStatus>(.x, .x, .x)))
        
        XCTAssertTrue(resultWithDraws == expected)
        XCTAssertTrue(resultWithDraws == resultWithoutDraws)
    }

    func testTopRowClearWin() {
        let cell0 = Cell(rows: (
            Row(.o, .u, .u),
            Row(.u, .o, .u),
            Row(.u, .u, .o)))
        let cell1 = Cell(rows: (
            Row(.u, .o, .u),
            Row(.u, .o, .u),
            Row(.u, .o, .u)))
        let cell2 = Cell(rows: (
            Row(.u, .u, .o),
            Row(.u, .o, .u),
            Row(.o, .u, .u)))

        let cell3 = Cell(rows: (
            Row(.x, .o, .x),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let cell4 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell5 = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))

        let cell6 = Cell(rows: (
            Row(.x, .o, .x),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let cell7 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell8 = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))

        let board = Board(rows: (
            Row(cell0, cell1, cell2),
            Row(cell3, cell4, cell5),
            Row(cell6, cell7, cell8)))
        let resultWithDraws = board.winner(drawCountsForEitherPlayer: true)
        let resultWithoutDraws = board.winner(drawCountsForEitherPlayer: false)

        let expected: CellStatus = .o

        XCTAssertEqual(resultWithDraws, expected)
        XCTAssertEqual(resultWithDraws, resultWithoutDraws)
    }

    func testTopRowWinUsingDraw() {
        let cell0 = Cell(rows: (
            Row(.x, .u, .u),
            Row(.u, .x, .u),
            Row(.u, .u, .o)))
        let cell1 = Cell(rows: (
            Row(.o, .x, .x),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))
        let cell2 = Cell(rows: (
            Row(.u, .u, .x),
            Row(.u, .x, .u),
            Row(.x, .u, .u)))

        let cell3 = Cell(rows: (
            Row(.x, .o, .x),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let cell4 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell5 = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))

        let cell6 = Cell(rows: (
            Row(.x, .o, .x),
            Row(.x, .o, .o),
            Row(.o, .x, .x)))
        let cell7 = Cell(rows: (
            Row(.u, .u, .u),
            Row(.u, .u, .u),
            Row(.u, .u, .u)))
        let cell8 = Cell(rows: (
            Row(.o, .x, .o),
            Row(.x, .x, .o),
            Row(.o, .o, .x)))

        let board = Board(rows: (
            Row(cell0, cell1, cell2),
            Row(cell3, cell4, cell5),
            Row(cell6, cell7, cell8)))
        let resultWithDraws = board.winner(drawCountsForEitherPlayer: true)
        let resultWithoutDraws = board.winner(drawCountsForEitherPlayer: false)

        let expectedWithDraws: CellStatus = .x
        let expectedWithoutDraws: CellStatus = .undecided

        XCTAssertEqual(resultWithDraws, expectedWithDraws)
        XCTAssertEqual(resultWithoutDraws, expectedWithoutDraws)
        XCTAssertNotEqual(resultWithDraws, expectedWithoutDraws)
    }
}
