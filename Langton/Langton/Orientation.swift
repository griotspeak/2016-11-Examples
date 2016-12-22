//
//  Orientation.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

enum Orientation {
    case north
    case east
    case south
    case west

    func turn(_ direction: RelativeDirection) -> Orientation {
        switch (self, direction) {
        case (.east, .left), (.west, .right):
            return .north
        case (.south, .left), (.north, .right):
            return .east
        case (.west, .left), (.east, .right):
            return .south
        case (.north, .left), (.south, .right):
            return .west
        }
    }
}
