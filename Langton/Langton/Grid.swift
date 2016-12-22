//
//  Grid.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

struct Grid : Equatable {
    internal var spots: [Spot]
    let rowCount: Int
    let columnCount: Int

    init(rows rowCount: Int, columns columnCount: Int, spots: [Spot]) {
        self.rowCount = rowCount
        self.columnCount = columnCount
        precondition(spots.count == rowCount * columnCount, "Incorrect spot count")
        self.spots = spots
    }

    private func index(row: Int, column: Int) -> Int {
        precondition(row < rowCount, "invalid row")
        precondition(column < columnCount, "invalid column")
        let index = row * columnCount + column
        return index
    }

    func updating(location: Location, newValue: Spot) -> Grid {
        return updating(row: location.y, column: location.x, newValue: newValue)
    }

    func updating(row: Int, column: Int, newValue: Spot) -> Grid {
        var newSpots = spots
        newSpots[index(row: row, column: column)] = newValue
        return Grid(rows: rowCount, columns: columnCount, spots: newSpots)
    }

    subscript(row: Int, column: Int) -> Spot {
        get {
            return spots[index(row: row, column: column)]
        }
    }

    subscript(location: Location) -> Spot {
        get {
            return self[location.y, location.x]
        }
    }

    func flippingSpot(at location: Location) -> Grid {
        return updating(location: location, newValue: self[location].flipped)
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: Grid, rhs: Grid) -> Bool {
        return (lhs.spots == rhs.spots &&
            lhs.rowCount == rhs.rowCount &&
            lhs.columnCount == rhs.columnCount)
    }
    
}
