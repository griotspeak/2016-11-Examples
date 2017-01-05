//
//  StandardGame.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/17.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

class StandardGame : Equatable, CustomStringConvertible  {

    let history: NonemptyList<Cell>

    var currentState: Cell {
        return history.last
    }

    init(history: NonemptyList<Cell> = NonemptyList(Cell())) {
        self.history = history
    }

    var next: Cell.Marker {
        return currentState.markerCount % 2 == 0 ? .x : .o
    }

    var isComplete: Bool {
        switch currentState.winner(drawCountsForEitherPlayer: false) {
        case .x, .o, .draw:
            return true
        case .undecided:
            return false
        }
    }

    func place(_ marker: Cell.Marker, at location: (row: Int, column: Int)) -> StandardGame? {
        guard next == marker,
            let newState = currentState.place(marker: marker, row: location.row, column: location.column) else { return nil }


        return StandardGame(history: history.appending(newState))
    }

    static func == (_ lhs: StandardGame, _ rhs: StandardGame) -> Bool {
        return lhs.history == rhs.history
    }

    var description: String {
        return currentState.description
    }
}


