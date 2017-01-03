//
//  ViewController.swift
//  RPG2017
//
//  Created by TJ Usiyan on 2017/01/03.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    let character = PlayerCharacter(name: "Grace", classification: .none)

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var classLabel: UILabel!

    @IBAction func hurt() {
        character.takeDamage(10)
    }

    @IBAction func heal() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = character.name
        classLabel.text = String(describing: character.classification)
    }
}

