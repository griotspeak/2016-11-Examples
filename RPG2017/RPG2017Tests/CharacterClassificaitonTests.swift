//
//  CharacterClassificaitonTests.swift
//  RPG2017
//
//  Created by TJ Usiyan on 2017/01/03.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
import RPG2017

class CharacterClassificaitonTests: XCTestCase {
    func testTakeDamage() {
        let tim = PlayerCharacter(name: "Tim", classification: .none)
        XCTAssertEqual(tim.health, 100)
        tim.takeDamage(10)
        XCTAssertEqual(tim.health, 90)
        tim.takeDamage(100)
        XCTAssertEqual(tim.health, 0)
    }
}
