//
//  Post.swift
//  Books
//
//  Created by TJ Usiyan on 2017/01/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

struct Post {
    var text: String
    var createdAt: Date
    var postID: String
    var user: User

    init(text: String, createdAt: Date, postID: String, user: User) {
        self.text = text
        self.createdAt = createdAt
        self.postID = postID
        self.user = user
    }

    init?(jsonObject: [String: Any]) {

        guard let text = jsonObject["text"] as? String,
            let createdAtString = jsonObject["created_at"] as? String,
            let userDict = jsonObject["user"] as? [String : Any],
            let postID = jsonObject["id"] as? String,
            let createdAtDate = AppNetAPI.dateFormatter.date(from: createdAtString),
            let theUser = User(jsonObject: userDict) else {
                // Don't have enough information to construct a Post
                return nil
        }

        self.init(text: text, createdAt: createdAtDate, postID: postID, user: theUser)
    }
}

extension Post {
    internal static func array(from jsonObjects: [[String: Any]]) -> [Post]? {
        let postArray = jsonObjects.flatMap(Post.init(jsonObject:))

        if jsonObjects.count != postArray.count {
            return nil
        }

        return postArray
    }
}

extension Post : Hashable {
    public static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.postID == rhs.postID
    }


    var hashValue: Int {
        return postID.hashValue
    }
}




