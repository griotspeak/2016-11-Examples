//
//  GameState.swift
//  Mastermind
//
//  Created by TJ Usiyan on 2017/01/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

enum State {
    case inProgress([Code])
}

public struct Code : ExpressibleByArrayLiteral {
    var colors: [Color]
    public var length: Int {
        return colors.count
    }

    public init(_ value: [Color]) {
        self.colors = value
    }

    public init(_ values: Color...) {
        self.init(values)
    }

    public init(arrayLiteral elements: Color...) {
        self.init(elements)
    }
}

extension Code : Sequence {
    /// Returns an iterator over the elements of this sequence.
    public func makeIterator() -> IndexingIterator<[Color]> {
        return colors.makeIterator()
    }

    public typealias Iterator = IndexingIterator<[Color]>
    
}

extension Code : Equatable {
    public static func ==(lhs:Code, rhs:Code) -> Bool {
        return lhs.colors == rhs.colors
    }
}

public enum Color : Hashable {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case magenta
    case lightGrey
}

extension Color {
    public var cgColor: CGColor {
        switch self {
        case .red:
            return UIColor.red.cgColor
        case .orange:
            return UIColor.orange.cgColor
        case .yellow:
            return UIColor.yellow.cgColor
        case .green:
            return UIColor.green.cgColor
        case .blue:
            return UIColor.blue.cgColor
        case .purple:
            return UIColor.purple.cgColor
        case .magenta:
            return UIColor.magenta.cgColor
        case .lightGrey:
            return UIColor.lightGray.cgColor
        }
    }
}

