//
//  Board.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/16.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

public struct Board : CustomStringConvertible, BoardStatusExtractable {
    typealias Storage = ThreeByThree<Cell>
    internal let storage: Storage

    public init(rows: Rows<Cell>) {
        self.storage = Storage(rows)
    }

    public var description: String {
        func thickLine(_ start: Int) -> String {
            return "\(start)↓ ========== \(start + 1)↓ ========== \(start + 2)↓ ========== \n"
        }
        func toString(row: Row<Cell>) -> String {
            let thinLine =  "  ---+---+--- # ---+---+--- # ---+---+--- \n"
            return [
                "  \(row.left.topRow) # \(row.middle.topRow) # \(row.right.topRow) \n",
                thinLine,
                "  \(row.left.middleRow) # \(row.middle.middleRow) # \(row.right.middleRow) \n",
                thinLine,
                "  \(row.left.bottomRow) # \(row.middle.bottomRow) # \(row.right.bottomRow) \n"
                ].joined()
        }


        let emptyLine = "                                          \n"

        var string = thickLine(0)
        string.append(emptyLine)
        string.append(toString(row: topRow))
        string.append(emptyLine)
        string.append(thickLine(3))
        string.append(emptyLine)
        string.append(toString(row: middleRow))
        string.append(emptyLine)
        string.append(thickLine(6))
        string.append(emptyLine)
        string.append(toString(row: bottomRow))
        string.append(emptyLine)
        
        return string
    }

    internal func cellRepresentation(drawCountsForEitherPlayer: Bool) -> ThreeByThree<CellStatus> {
        return storage.map { $0.winner(drawCountsForEitherPlayer: drawCountsForEitherPlayer) }
    }

    internal func markerIndices(drawCountsForEitherPlayer: Bool) -> (x: Set<Int>, o: Set<Int>, undecided: Set<Int>) {
        return cellRepresentation(drawCountsForEitherPlayer: drawCountsForEitherPlayer).elements.enumerated().reduce(([], [], [])) { (accum, tuple) in
            let (index, element) = tuple
            switch element {
            case .undecided:
                return (x: accum.0, o: accum.1, undecided: accum.2.union([index]))
            case .draw where drawCountsForEitherPlayer:
                return (x: accum.0.union([index]), o: accum.1.union([index]), undecided: accum.2)
            case .draw:
                return accum
            case .o:
                return (x: accum.0, o: accum.1.union([index]), undecided: accum.2)
            case .x:
                return (x: accum.0.union([index]), o: accum.1, undecided: accum.2)
            }
        }
    }

    internal var topRow: Row<Cell> {
        return storage.rows.top
    }

    internal var middleRow: Row<Cell> {
        return storage.rows.middle
    }

    internal var bottomRow: Row<Cell> {
        return storage.rows.bottom
    }
}
