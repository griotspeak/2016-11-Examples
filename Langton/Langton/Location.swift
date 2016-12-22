//
//  Location.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

struct Location : Equatable {
    public let x: Int
    public let y: Int

    public static func == (_ lhs: Location, _ rhs: Location) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public init(_ units: Int, _ cardinalDirection: Orientation, from location: Location) {
        precondition(units >= 0, "negative `blocks` '\(units)' value is invalid")
        switch cardinalDirection {
        case .north:
            self.init(x: location.x, y: location.y + units)
        case .east:
            self.init(x: location.x + units, y: location.y)
        case .south:
            self.init(x: location.x, y: location.y - units)
        case .west:
            self.init(x: location.x - units, y: location.y)
        }
    }
}
