//
//  Spot.swift
//  Langton
//
//  Created by TJ Usiyan on 2016/12/22.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public enum Spot {
    case black
    case white

    public var flipped: Spot {
        switch self {
        case .black:
            return .white
        case .white:
            return .black
        }
    }
}
