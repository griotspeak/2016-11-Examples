//
//  AppNetAPI.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation
import CoreData

class AppNetAPI {
    enum Error: Swift.Error {
        case invalidJSONData
    }

    internal static let globalStreamURL: URL = URL(string:"https://alpha-api.app.net/stream/0/posts/stream/global")!


    fileprivate static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZ"
        let timeZoneName = TimeZone.abbreviationDictionary["UTC"]!
        let timeZone = TimeZone(identifier: timeZoneName)
        formatter.timeZone = timeZone
        return formatter
    }()

    class func postsFromJSONData(_ data: Data,
                                 inContext context: NSManagedObjectContext) -> PostsResult {


        do {
            guard let jsonObject: [String: Any] = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let postDictionariesArray = jsonObject["data"] as? [[String: NSObject]] else {

                    // The JSON structure doesn't match our expectations
                    return .failure(Error.invalidJSONData)
            }

            var actualPosts = [Post]()
            for postJSON in postDictionariesArray {
                if let post = postFromJSONObject(postJSON, inContext: context) {
                    actualPosts.append(post)
                }
            }

            if actualPosts.count == 0 && postDictionariesArray.count > 0 {
                // We weren't able to parse any of the post.
                // Maybe the JSON format for post has changed.
                return .failure(Error.invalidJSONData)
            }
            return .success(actualPosts)
        }
        catch let error {
            return .failure(error)
        }
    }

    fileprivate class func postFromJSONObject(_ json: [String : AnyObject],
                                              inContext context: NSManagedObjectContext) -> Post? {

        guard let text = json["text"] as? String,
            let createdAtString = json["created_at"] as? String,
            let userDict = json["user"] as? [String : AnyObject],
            let postID = json["id"] as? String,
            let createdAtDate = dateFormatter.date(from: createdAtString),
            let user = userFromJSONObject(userDict, inContext: context) else {

                // Don't have enough information to construct a Post
                return nil
        }


        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        let predicate = NSPredicate(format: "postID == \(postID)")
        fetchRequest.predicate = predicate

        let fetchedPosts: [Post] = {
            var posts: [Post]!
            context.performAndWait() {
                posts = try! context.fetch(fetchRequest) as! [Post]
            }


            return posts
        }()

        if let firstPost = fetchedPosts.first {
            return firstPost
        }

        var post: Post!
        context.performAndWait({ () -> Void in
            post = NSEntityDescription.insertNewObject(forEntityName: Post.entityName,
                                                       into: context) as! Post
            post.text = text
            post.createdAt = createdAtDate as NSDate
            post.postID = postID
            post.user = user

        })

        return post
    }

    fileprivate class func userFromJSONObject(_ json: [String : AnyObject],
                                              inContext context: NSManagedObjectContext) -> User? {

        guard let userName = json["username"] as? String,
            let displayName = json["name"] as? String,
            let userID = json["id"] as? String,
            let coverImageDict = json["cover_image"],
            let imageURL = coverImageDict["url"] as? String else {

                // Don't have enough information to construct a Post
                return nil
        }


        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: User.entityName)
        let predicate = NSPredicate(format: "userID == \(userID)")
        fetchRequest.predicate = predicate

        let fetchedUsers: [User] = {
            var users: [User]!
            context.performAndWait() {
                users = try! context.fetch(fetchRequest) as! [User]
            }

            return users
        }()

        if let firstUser = fetchedUsers.first {
            return firstUser
        }

        var user: User!
        context.performAndWait({ () -> Void in
            user = NSEntityDescription.insertNewObject(forEntityName: User.entityName,
                                                       into: context) as! User
            user.userID = userID
            user.displayName = displayName
            user.name = userName
            user.imageURLString = imageURL
        })
        
        return user
    }
}
