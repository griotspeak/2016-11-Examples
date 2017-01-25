//
//  UserStore.swift
//  PhotoCaching
//
//  Created by TJ Usiyan on 2017/01/25.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit


internal final class UserStore {
    let imageStore = ImageStore<User>()

    fileprivate let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()


    public func avatarImage(user: User) -> UIImage? {
        if let image = imageStore.imageForKey(user) {
            return image
        } else {
            return nil
        }
    }

    public func setAvatarImage(_ image: UIImage?, user: User) {
        if let _image = image {
            imageStore.setImage(_image, forKey: user)
        } else {
            imageStore.removeImageForKey(user)
        }
    }
}

extension UserStore {
    func fetchImage(_ user: User, completion: @escaping (ImageResult) -> Void) {
        imageStore.fetchImage(user, completion: completion)
    }
}
