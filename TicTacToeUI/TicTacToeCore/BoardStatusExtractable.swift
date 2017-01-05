//
//  BoardStatusExtractable.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/16.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

internal protocol BoardStatusExtractable {
    func markerIndices(drawCountsForEitherPlayer: Bool) -> (x: Set<Int>, o: Set<Int>, undecided: Set<Int>)
}

enum CellStatus {
    case x
    case o
    case draw
    case undecided
}

extension BoardStatusExtractable {
    /// For Cells
    /// - `.some(.x)` or `.some(.o)`: the respective player has won
    /// - `.some(.empty)`: Draw
    /// - `.none`: undecided
    public func winner(drawCountsForEitherPlayer: Bool)  -> CellStatus {

        let (xIndices, oIndices, empty) = markerIndices(drawCountsForEitherPlayer: drawCountsForEitherPlayer)
        let winningIndices = winningSets(forSquareWithlength: 3)

        let xHasWinning: Bool = winningIndices.reduce(false) {
            $0 || xIndices.isSuperset(of: $1)
        }

        let oHasWinning: Bool = winningIndices.reduce(false) {
            $0 || oIndices.isSuperset(of: $1)
        }

        switch (xHasWinning, oHasWinning, empty.isEmpty) {
        case (true, true, false), (true, true, true), (false, false, true):
            return .draw
        case (true, false, false), (true, false, true):
            return .x
        case (false, true, false), (false, true, true):
            return .o
        case (false, false, false):
            return .undecided
        }
    }


    func winningHorizontalSets(forSquareWithlength length: Int) -> [Set<Int>] {
        return stride(from: 0, to: (length * length), by: length).map { Set($0..<($0 + length)) }
    }

    func winningVerticalSets(forSquareWithlength length: Int) -> [Set<Int>] {
        return (0..<length).map { Set( stride(from: $0, to: ($0 + (length*length)), by: length) ) }
    }

    func winningDiagonalSets(forSquareWithlength length: Int) -> [Set<Int>] {
        return [
            Set(stride(from: 0, to: length*length, by: length + 1)), // descending
            Set(stride(from: length - 1, to: (length*length) - 1, by: length - 1)) // ascending
        ]
    }

    public func winningSets(forSquareWithlength length: Int) -> [Set<Int>] {
        return [winningHorizontalSets(forSquareWithlength: length), winningVerticalSets(forSquareWithlength: length), winningDiagonalSets(forSquareWithlength: length)].flatMap { $0 }
    }
}
