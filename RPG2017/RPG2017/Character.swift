//
//  Character.swift
//  RPG2017
//
//  Created by TJ Usiyan on 2017/01/03.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public class PlayerCharacter  {
    public fileprivate(set) var name: String
    public fileprivate(set) var health: Int {
        didSet {
            if health < 0 {
                health = 0
            }
        }
    }
    public fileprivate(set) var magic: Int
    public fileprivate(set) var experience: Int
    public fileprivate(set) var items: [Item]
    public fileprivate(set) var level: Int
    public fileprivate(set) var classification: CharacterClassification

    public init(name: String, classification: CharacterClassification) {
        self.name = name
        self.health = 100
        self.magic = 10
        self.experience = 0
        self.items = []
        self.level = 0
        self.classification = .none
    }

    public func takeDamage(_ amount: Int) {
        health -= amount
    }
}
