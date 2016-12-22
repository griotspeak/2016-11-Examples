//
//  Ant.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

struct Ant : Equatable {
    public let location: Location
    public let orientation: Orientation
    public init(at location: Location, facing orientation: Orientation) {
        self.location = location
        self.orientation = orientation
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: Ant, rhs: Ant) -> Bool {
        return lhs.location == rhs.location && lhs.orientation == rhs.orientation
    }
}
