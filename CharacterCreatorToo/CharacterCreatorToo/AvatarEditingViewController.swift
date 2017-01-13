//
//  AvatarEditingViewController.swift
//  CharacterCreatorToo
//
//  Created by TJ Usiyan on 2017/01/13.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

protocol AvatarEditingViewControllerDelegate: NSObjectProtocol {
    func avatarEditingViewControllerDidEndEditing(_ viewController: AvatarEditingViewController, avatar: Avatar)

}

class AvatarEditingViewController: UIViewController {
    var avatar: Avatar! = nil
    weak var delegate: AvatarEditingViewControllerDelegate?

    @IBAction func endEditing(_ sender: UIButton) {
        if let name = AvatarEditingViewController.validateText(inside: nameField) {
            avatar.name = name
            self.delegate?.avatarEditingViewControllerDidEndEditing(self, avatar: avatar)
        }
    }

    @IBOutlet var nameField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.nameField.text = avatar.name
    }
}

extension AvatarEditingViewController : UITextFieldDelegate {
    static func validateText(inside field: UITextField) -> String? {
        if let text = field.text, text.isEmpty == false {
            return text
        } else {
            return nil
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return textField.text?.isEmpty == false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let name = AvatarEditingViewController.validateText(inside: nameField) else {
            return false
        }

        avatar.name = name
        textField.resignFirstResponder()
        return true
    }

}
