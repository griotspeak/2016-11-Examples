//
//  GameTests.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/13.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import TicTacToeCore

class GameTests: XCTestCase {
    func testInitialDescription() {
        let game = Game(xPlayer: "Tom", oPlayer: "Jerry")

        let result = game.description
        let expected = "Tom: x\nJerry: o\n\(Cell())"
        XCTAssertEqual(result, expected)
    }
}

