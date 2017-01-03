//
//  CharacterClassification.swift
//  RPG2017
//
//  Created by TJ Usiyan on 2017/01/03.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public enum CharacterClassification : CustomStringConvertible {
    case none

    public var description: String {
        switch self {
        case .none:
            return "None"
        }
    }
}
