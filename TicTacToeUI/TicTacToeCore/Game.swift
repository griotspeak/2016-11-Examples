//
//  Game.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/13.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

class Game {
    var board: Cell
    var xPlayer: String
    var oPlayer: String
    var currentPlayer: Cell.Marker

    init(xPlayer: String, oPlayer: String) {
        self.board = Cell()
        self.xPlayer = xPlayer
        self.oPlayer = oPlayer
        self.currentPlayer = .x
    }
}

extension Game : CustomStringConvertible {
    var description: String {
        return "\(xPlayer): x\n\(oPlayer): o\n\(board)"
    }
}
