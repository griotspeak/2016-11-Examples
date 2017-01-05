//
//  Board.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/13.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public final class Cell : Equatable, CustomStringConvertible, BoardStatusExtractable, DefaultValueType {
    typealias Storage = ThreeByThree<Space>
    internal let storage: Storage

    public init(rows: Rows<Space> = (top: .defaultValue, middle: .defaultValue, bottom: .defaultValue)) {
        self.storage = ThreeByThree(rows)
    }

    fileprivate init(_ list: [Space]) {
        precondition(list.count == 9)
        self.storage = Storage(list)
    }

    static var spacesKey: String { return "spaces" }

    public static var defaultValue: Cell {
        return .empty
    }
    
    public static var empty: Cell {
        return Cell()
    }

    public var description: String {
        let emptyLine =      "           "
        let horizontalLine = "---+---+---"

        let topRow = String(describing: storage.rows.top)
        let middleRow = String(describing: storage.rows.middle)
        let bottomRow = String(describing: storage.rows.bottom)

        return [
            emptyLine,
            topRow,
            horizontalLine,
            middleRow,
            horizontalLine,
            bottomRow,
            emptyLine
            ].joined(separator: "\n")
    }

    public subscript(row: Int, col: Int) -> Cell.Space {
        return storage[row, col]
    }

    internal var spaces: [Cell.Space] {
        return storage.elements
    }

    public func place(marker: Marker, row: Int, column: Int) -> Cell? {
        if isAvailable(row: row, col: column) {
            var newSpaces = spaces
            newSpaces[ThreeByThree<Space>.index(row: row, col: column)] = marker.spaceValue
            return Cell(newSpaces)
        } else {
            return nil
        }
    }

    public func place(marker: Marker, index: Int) -> Cell? {
        return ThreeByThree<Space>.coordinates(index: index).flatMap { (row, column) in
            self.place(marker: marker, row: row, column: column)
        }
    }

    internal func markerIndices(drawCountsForEitherPlayer: Bool) -> (x: Set<Int>, o: Set<Int>, undecided: Set<Int>) {
        return spaces.enumerated().reduce(([], [], [])) { (accum, tuple) in
            let (index, element) = tuple
            switch element {
            case .empty:
                return (x: accum.0, o: accum.1, undecided: accum.2.union([index]))
            case .o:
                return (x: accum.0, o: accum.1.union([index]), undecided: accum.2)
            case .x:
                return (x: accum.0.union([index]), o: accum.1, undecided: accum.2)
            }
        }
    }

    internal var spaceCounts: (x: Int, o: Int, empty: Int) {
        let (xIndices, oIndices, empty) = markerIndices(drawCountsForEitherPlayer: false)
        return (xIndices.count, oIndices.count, empty.count)
    }

    internal var markerCount: Int {
        let counts = spaceCounts
        return counts.o + counts.x
    }

    public func isAvailable(row: Int, col: Int) -> Bool {
        return storage[row, col] == .empty
    }

    public static func ==(lhs:Cell, rhs:Cell) -> Bool {
        return lhs.storage == rhs.storage
    }

    internal var topRow: Row<Space> {
        return storage.rows.top
    }

    internal var middleRow: Row<Space> {
        return storage.rows.middle
    }

    internal var bottomRow: Row<Space> {
        return storage.rows.bottom
    }
}

extension Cell {
    public enum Space : CustomStringConvertible, DefaultValueType, Equatable {
        case x
        case o
        case empty

        internal static let u: Space = .empty
        public static let defaultValue: Space = .empty

        public var description: String {
            switch self {
            case .x:
                return "x"
            case .o:
                return "o"
            case .empty:
                return " "
            }
        }
        public static func ==(lhs:Space, rhs:Space) -> Bool {
            switch (lhs, rhs) {
            case (.x, .x), (.o, .o), (.empty, .empty):
                return true
            case (.x, _), (.o, _), (.empty, _):
                return false
            }
        }

        internal var jsonValue: String {
            switch self {
            case .x:
                return "x"
            case .o:
                return "o"
            case .empty:
                return " "
            }
        }
    }

    public enum Marker {
        case x
        case o

        internal var spaceValue: Space {
            switch self {
            case .x:
                return .x
            case .o:
                return .o
            }
        }
    }
}
