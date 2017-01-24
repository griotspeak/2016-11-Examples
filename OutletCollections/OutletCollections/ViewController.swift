//
//  ViewController.swift
//  OutletCollections
//
//  Created by TJ Usiyan on 2017/01/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        for (index, button) in colorButtons.enumerated() {
            button.setTitle("Number \(index + 1)", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

