//
//  PostStore.swift
//  AppNetApp
//
//  Created by TJ Usiyan on 2017/02/01.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit
import CoreData

enum PostsResult {
    case success([Post])
    case failure(Error)
}

internal final class PostStore {
    let imageStore = ImageStore<String>()
    let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack = CoreDataStack(modelName: "AppNetApp")) {
        self.coreDataStack = coreDataStack
    }

    fileprivate let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
}

extension PostStore {

    func processRecentPostsRequest(data: Data?, error: NSError?) -> PostsResult {
        guard let jsonData = data else {
            return .failure(error!)
        }

        return AppNetAPI.postsFromJSONData(jsonData, inContext: self.coreDataStack.privateQueueContext)
    }

    internal func fetchMainQueuePosts(predicate: NSPredicate? = nil,
                                      sortDescriptors: [NSSortDescriptor]? = nil) throws -> [Post] {

        let fetchRequest = NSFetchRequest<Post>(entityName: "Post")
        fetchRequest.sortDescriptors = sortDescriptors

        let mainQueueContext = self.coreDataStack.mainQueueContext
        var mainQueuePost: [Post]?
        var fetchRequestError: Error?
        mainQueueContext.performAndWait({
            do {
                mainQueuePost = try mainQueueContext.fetch(fetchRequest)
            }
            catch let error {
                fetchRequestError = error
            }
        })

        guard let post = mainQueuePost else {
            throw fetchRequestError!
        }

        return post
    }

    internal func fetchGlobalStreamPosts(completion: @escaping (PostsResult) -> Void) {

        let url = AppNetAPI.globalStreamURL
        let request = URLRequest(url: url as URL)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in

            var result = self.processRecentPostsRequest(data: data, error: error as NSError?)

            if case let .success(posts) = result {
                let privateQueueContext = self.coreDataStack.privateQueueContext
                privateQueueContext.performAndWait({
                    try! privateQueueContext.obtainPermanentIDs(for: posts)
                })
                let objectIDs = posts.map{ $0.objectID }
                let predicate = NSPredicate(format: "self IN %@", objectIDs)
                let sortByDateTaken = NSSortDescriptor(key: "createdAt", ascending: false)

                do {
                    try self.coreDataStack.saveChanges()

                    let mainQueuePosts = try self.fetchMainQueuePosts(predicate: predicate,
                                                                      sortDescriptors: [sortByDateTaken])
                    result = .success(mainQueuePosts)
                }
                catch let error {
                    result = .failure(error)
                }
            }
            completion(result)
        })
        task.resume()
    }
}

extension PostStore {
    func processImageRequest(data: Data?, error optionalError: NSError?) -> ImageResult {

        guard let imageData = data,
            let image = UIImage(data: imageData) else {
                if let error = optionalError {
                    return .systemFailure(error)
                } else {
                    return .systemFailure(ImageResult.Error.imageCreation)
                }
        }

        return .success(image)
    }

    func fetchImage(_ user: User, completion: @escaping (ImageResult) -> Void) {

        let imageKey = user.imageKey!
        if let image = imageStore.imageForKey(imageKey) {
            completion(.success(image))
            return
        }

        let imageURL = URL(string: user.imageURLString!)!
        let request = URLRequest(url: imageURL)

        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in

            let result = self.processImageRequest(data: data, error: error as NSError?)

            if case let .success(image) = result {
                user.image = image
                self.imageStore.setImage(image, forKey: imageKey)
            }
            
            completion(result)
        }) 
        task.resume()
    }
}
