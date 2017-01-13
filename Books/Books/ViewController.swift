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
    var posts: [Post] = [] {
        didSet {
            updateUI()
        }
    }
    @IBOutlet var textLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        postStore.fetchGlobalPosts { result in
            switch result {
            case let .success(array):
                self.posts = array
            case let .failure(error):
                print("Failed to retrieve books. Error: \(error)")
                //                self.posts = [] // not necessary but… valid.
            }
        }
    }

    func updateUI() {
        if let firstPost = posts.first {
            textLabel.text = firstPost.user
            .displayName
        } else {
            textLabel.text = "No posts"
        }
    }
}
