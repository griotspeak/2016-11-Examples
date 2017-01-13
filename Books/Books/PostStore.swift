//
//  PostStore.swift
//  Books
//
//  Created by TJ Usiyan on 2017/01/05.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

enum PostsResult {
    case success([Post])
    case failure(PostStore.Error)
}

internal final class PostStore {

    enum Error: Swift.Error {
        case http(HTTPURLResponse)
        case system(Swift.Error)
        case appNet(AppNetAPI.Error)
    }

    fileprivate let session: URLSession = {
        return URLSession(configuration: .default)
    }()

    internal func fetchGlobalPosts(completion: @escaping (PostsResult) -> ()) {
        let task = session.dataTask(with: AppNetAPI.globalStreamURL) { (optionalData, optionalResponse, optionalError) in

            if let data = optionalData {
                completion(self.processRecentPostsRequest(data: data, error: optionalError ))
            } else if let response = optionalResponse {
                let error = Error.http(response as! HTTPURLResponse)
                completion(.failure(error))
            } else {
                completion(.failure(.system(optionalError!)))
            }
        }

        task.resume()
    }

    internal func processRecentPostsRequest(data: Data, error: Swift.Error?) -> PostsResult {

        if let dictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
            print(dictionary)
            fatalError()
//            if let posts = Post.array(from: postDictionaries) {
//                return .success(posts)
//            } else {
//                return .failure(.appNet(.invalidJSONData))
//            }
        } else {
            return .failure(.system(error!))
        }
    }
}
