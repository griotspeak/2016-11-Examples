//
//  ViewController.swift
//  Books
//
//  Created by TJ Usiyan on 2017/01/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let postStore = PostStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postStore.fetchGlobalPosts { result in
            print(result)
        }
    }
}
