//
//  NonemptyList.swift
//  TicTacToeCore
//
//  Created by TJ Usiyan on 2016/12/17.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

struct NonemptyList<Element : Equatable> : Equatable {
    let head: Element
    let tail: [Element]

    init(_ head: Element, _ tail: [Element] = []) {
        self.head = head
        self.tail = tail
    }

    init?(array: [Element]) {
        guard let head = array.first else {
            return nil
        }

        self.head = head
        self.tail = Array(array.dropFirst())
    }

    static func == (_ lhs: NonemptyList<Element>, _ rhs: NonemptyList<Element>) -> Bool {
        return lhs.head == rhs.head && lhs.tail == rhs.tail
    }

    var first: Element {
        return head
    }

    var last: Element {
        if let tailEnd = tail.last {
            return tailEnd
        } else {
            return head
        }
    }

    func appending(_ element: Element) -> NonemptyList<Element> {
        return NonemptyList<Element>(head, tail + [element])
    }
}

extension Array where Element : Equatable {
    init(nonemptyList: NonemptyList<Element>) {
        self = [nonemptyList.head] + nonemptyList.tail
        print(self)
    }
}
