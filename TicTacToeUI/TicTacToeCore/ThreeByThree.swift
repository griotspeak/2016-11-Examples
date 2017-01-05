//
//  ThreeByThree.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/16.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

public typealias Rows<Element> = (top: Row<Element>, middle: Row<Element>, bottom: Row<Element>)

public struct ThreeByThree<Element> {
    internal let rows: Rows<Element>

    init(_ rows: Rows<Element>) {
        self.rows = rows
    }

    init(_ list: [Element]) {
        self.init((
            top: Row(list[0], list[1], list[2]),
            middle: Row(list[3], list[4], list[5]),
            bottom: Row(list[6], list[7], list[8])
        ))
    }

    internal var elements: [Element] {
        return [
            rows.top.left, rows.top.middle, rows.top.right,
            rows.middle.left, rows.middle.middle, rows.middle.right,
            rows.bottom.left, rows.bottom.middle, rows.bottom.right,
        ]
    }

    public subscript(row: Int, col: Int) -> Element {
        precondition(row < 3, "invalid row value \(row)")
        precondition(col < 3, "invalid row value \(col)")
        return elements[ThreeByThree<Element>.index(row: row, col: col)]
    }

    internal static func index(row: Int, col: Int) -> Int {
        return (row * 3) + col
    }

    internal static func coordinates(index: Int) -> (row: Int, column: Int)? {
        guard index < 9, index >= 0  else { return nil }
        let column = index % 3
        let row = (index - column) / 3
        return (row, column)
    }

    public func map<T>(_ transform: (Element) throws -> T) rethrows -> ThreeByThree<T> {
        return try ThreeByThree<T>((rows.top.map(transform), rows.middle.map(transform), rows.bottom.map(transform)))
    }

}

extension ThreeByThree where Element : Equatable {
    public static func == (lhs: ThreeByThree<Element>, rhs: ThreeByThree<Element>) -> Bool {
        return ( lhs.rows.top == rhs.rows.top &&
            lhs.rows.middle == rhs.rows.middle &&
            lhs.rows.bottom == rhs.rows.bottom
        )
    }
}

public protocol DefaultValueType {
    static var defaultValue: Self { get }
}

public struct Row<Element> : CustomStringConvertible {
    public let left: Element
    public let middle: Element
    public let right: Element

    public init(_ left: Element, _ middle: Element, _ right: Element) {
        self.left = left
        self.middle = middle
        self.right = right
    }

    public var description: String {
        return " \(left) | \(middle) | \(right) "
    }

    public func map<T>(_ transform: (Element) throws -> T) rethrows -> Row<T> {
        return try Row<T>(transform(left), transform(middle), transform(right))
    }
}

extension Row where Element : DefaultValueType {
    public static var defaultValue: Row<Element> {
        return Row(.defaultValue, .defaultValue, .defaultValue)
    }
}

extension Row where Element : Equatable {
    public static func == (lhs: Row<Element>, rhs: Row<Element>) -> Bool {
        return (
            lhs.left == rhs.left &&
                lhs.middle == rhs.middle &&
                lhs.right == rhs.right
        )
    }
}
