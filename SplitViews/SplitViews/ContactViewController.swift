//
//  ContactViewController.swift
//  SplitViews
//
//  Created by TJ Usiyan on 2017/01/24.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contact: Contact? {
        didSet {
            updateUI()
        }
    }

    @IBOutlet var fullNameLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    func updateUI() {
        fullNameLabel.text = contact?.fullName ?? "No contact selected"
    }
}
