//
//  ViewController.swift
//  GovModel
//
//  Created by TJ Usiyan on 2017/01/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let petitionStore = PetitionStore()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        petitionStore.fetchPetitions { (result) in
            print(result)
        }
        
    }
}

