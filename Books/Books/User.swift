//
//  User.swift
//  Books
//
//  Created by TJ Usiyan on 2017/01/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var displayName: String
    var posts: Set<Post>

    init(name: String, displayName: String, posts: Set<Post> = []) {
        self.name = name
        self.displayName = displayName
        self.posts = posts
    }

    init?(jsonObject: [String:Any]) {
        guard let userName = jsonObject["username"] as? String,
            let displayName = jsonObject["name"] as? String else {
                // Don't have enough information to construct a Post
                return nil
        }
        self.init(name: userName, displayName: displayName)
    }
}
