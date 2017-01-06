//
//  ViewController.swift
//  TextEntry
//
//  Created by TJ Usiyan on 2017/01/06.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.delegate = self

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }


    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true {
            return false
        } else {

            print(textField.text!)
            return true
        }
    }
}

